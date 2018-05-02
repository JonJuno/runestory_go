//
//  LoginViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 5/1/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: RuneStoryGoUIViewController {
    
    var alert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func welcomeButtonPressed(_ sender: Any) {
        if let data = UserDefaults.standard.object(forKey: "currPlayer") as? NSData {
            let unarc = NSKeyedUnarchiver(forReadingWith: data as Data)
            unarc.setClass(Player.self, forClassName: "Player")
            currPlayer = unarc.decodeObject(forKey: "root") as! Player
        }
        if currPlayer != nil {
            performSegue(withIdentifier: "segueToMainGame", sender: self)
        } else {
            alert = UIAlertController(title: "Create New Character", message: "You do not have an existing character. What would you like to name them?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addTextField { (textField) in
                textField.text = ""
            }
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                currPlayer = Player(named: (self.alert?.textFields![0].text!)!, inventory: [])
                UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: currPlayer), forKey: "currPlayer")
                self.performSegue(withIdentifier: "segueToMainGame", sender: self)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMainGame" {
            let dest = segue.destination as! UITabBarController
            dest.selectedIndex = 2
        }
    }
    
}
