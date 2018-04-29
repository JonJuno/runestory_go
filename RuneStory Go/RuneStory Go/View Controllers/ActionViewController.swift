//
//  ActionViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class ActionViewController: RuneStoryGoUIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var manager: CLLocationManager!
    
    let regionRadius: CLLocationDistance = 200
    let encounterDistance: Int = 7
    let maxMobs: Int = 8
    
    var mobs: [Mob:MKPointAnnotation]!
    var selectedMob: Mob!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mobs = [:]
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        manager = CLLocationManager()
        manager.delegate = self
        switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                break
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
            default:
                let alertController = UIAlertController(title: "Location Access Disabled", message: "In order to use RuneStory Go, please open Settings and set location access for this app to 'When In Use'", preferredStyle: .alert)
                let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
                    if let url = NSURL(string: UIApplicationOpenSettingsURLString) {
                        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alertController.addAction(openAction)
                alertController.addAction(cancelAction)
            
                self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CLLocationManager.locationServicesEnabled() {
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
        }
        if let coor = mapView.userLocation.location?.coordinate{
            centerMapOnLocation(location: CLLocation(latitude: coor.latitude, longitude: coor.longitude))
            genMobs(location: CLLocation(latitude: coor.latitude, longitude: coor.longitude))
        }
    }

    func centerMapOnLocation(location: CLLocation) {
        let currRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(currRegion, animated: true)
    }
    
    func pinLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String, image: UIImage) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = title
        annotation.subtitle = subtitle
        
        mapView.addAnnotation(annotation)
        return annotation
    }
    
    func getValidMobCoordinates() -> CLLocationCoordinate2D {
        let center = mapView.centerCoordinate
        let latitude = center.latitude
        let longitude = center.longitude
        
        /* the following hails from Stack Overflow */
        let meterCord = 0.00900900900901 / 1000
        let randomMeters = UInt(arc4random_uniform(UInt32(regionRadius)))
        let randomPM = arc4random_uniform(6)
        let metersCordN = meterCord * Double(randomMeters)
        
        if randomPM == 0 {
            return CLLocationCoordinate2D(latitude: latitude + metersCordN, longitude: longitude + metersCordN)
        } else if randomPM == 1 {
            return CLLocationCoordinate2D(latitude: latitude - metersCordN, longitude: longitude - metersCordN)
        } else if randomPM == 2 {
            return CLLocationCoordinate2D(latitude: latitude + metersCordN, longitude: longitude - metersCordN)
        } else if randomPM == 3 {
            return CLLocationCoordinate2D(latitude: latitude - metersCordN, longitude: longitude + metersCordN)
        } else if randomPM == 4 {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude - metersCordN)
        } else {
            return CLLocationCoordinate2D(latitude: latitude - metersCordN, longitude: longitude)
        }
    }
    
    func genMobs(location: CLLocation) {
        for (mob, ano) in mobs {
            if !MKMapRectContainsPoint(mapView.visibleMapRect, MKMapPointForCoordinate(ano.coordinate)) {
                mapView.removeAnnotation(ano)
                mobs.removeValue(forKey: mob)
            }
        }
        if mobs.count < maxMobs && arc4random_uniform(UInt32(maxMobs)) == 0 {
            let mobStats = SkillStats()
            mobStats.setSkillLevel(skillName: "Attack", value: 20)
            mobStats.setSkillLevel(skillName: "Defense", value: 1)
            mobStats.setSkillLevel(skillName: "Magic", value: 1)
            mobStats.setSkillLevel(skillName: "Health", value: 20)
            let mobName = "Giant Rat"
            let mobDrop = [lobsterDrop]
            let mobXP = 10
            let mobImage = #imageLiteral(resourceName: "giant_rat")
            let mobCoordinates = getValidMobCoordinates()
            
            let newMob = Mob(named: mobName, withImage: mobImage, withItems: EquippedItems(), withStats: mobStats, withDrops: mobDrop, withXP: mobXP)
            
            mobs[newMob] = pinLocation(latitude: mobCoordinates.latitude, longitude: mobCoordinates.longitude, title: mobName, subtitle: "", image: mobImage)
        }
    }
    
    func checkMobEncounter(location: CLLocation) {
        for (mob, ano) in mobs {
            if location.distance(from: CLLocation(latitude: ano.coordinate.latitude, longitude: ano.coordinate.longitude)) <= CLLocationDistance(encounterDistance) {
                selectedMob = mob
                manager.stopUpdatingLocation()
                performSegue(withIdentifier: "beginBattleSegue", sender: self)
                return
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last!
        centerMapOnLocation(location: userLocation)
        genMobs(location: userLocation)
        checkMobEncounter(location: userLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if id == "beginBattleSegue" {
                let dest = segue.destination as! BattleViewController
                dest.battleModel = Battle(enemyMob: selectedMob)
            }
        }
    }

}

