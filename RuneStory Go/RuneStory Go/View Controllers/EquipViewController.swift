//
//  EquipViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import UIKit

class EquipViewController: RuneStoryGoUIViewController {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var chestImageView: UIImageView!
    @IBOutlet weak var legsImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var accessoryImageView: UIImageView!
    
    @IBOutlet weak var headOverlayImageView: UIImageView!
    @IBOutlet weak var chestOverlayImageView: UIImageView!
    @IBOutlet weak var rightOverlayImageView: UIImageView!
    @IBOutlet weak var leftOverlayImageView: UIImageView!
    @IBOutlet weak var accessoryOverlayImageView: UIImageView!
    @IBOutlet weak var legsOverlayImageView: UIImageView!
    

    @IBOutlet weak var attackStatsLabel: UILabel!
    @IBOutlet weak var defenseStatsLabel: UILabel!
    @IBOutlet weak var magicStatsLabel: UILabel!
    @IBOutlet weak var luckStatsLabel: UILabel!
    
    var selectedSlot: String?
    var opened: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opened = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /* replace images with what user currently has equipped */
        fillEquipment()
        calcEquipmentStats()
        opened = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillEquipment() {
        headImageView.image = UIImage(named: "head_slot")
        chestImageView.image = UIImage(named: "chest_slot")
        legsImageView.image = UIImage(named: "legs_slot")
        leftImageView.image = UIImage(named: "weapon_slot")
        rightImageView.image = UIImage(named: "shield_slot")
        accessoryImageView.image = UIImage(named: "accessory_slot")
        
        let equipped = currPlayer.equipped
        headOverlayImageView.image = equipped.head_item?.image
        chestOverlayImageView.image = equipped.chest_item?.image
        rightOverlayImageView.image = equipped.right_item?.image
        leftOverlayImageView.image = equipped.left_item?.image
        accessoryOverlayImageView.image = equipped.accessory_item?.image
        legsOverlayImageView.image = equipped.legs_item?.image
    }
    
    func calcEquipmentStats() {
        let attackVal = currPlayer.equippedStats(statName: "Attack")
        let defenseVal = currPlayer.equippedStats(statName: "Defense")
        let magicVal = currPlayer.equippedStats(statName: "Magic")
        let luckVal = currPlayer.equippedStats(statName: "Luck")
        
        attackStatsLabel.text = "Attack: " + String(describing: attackVal)
        defenseStatsLabel.text = "Defence: " + String(describing: defenseVal)
        magicStatsLabel.text = "Magic: " + String(describing: magicVal)
        luckStatsLabel.text = "Luck: " + String(describing: luckVal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if id == "equipTableSelectSegue" {
                let dest = segue.destination as! EquipSelectViewController
                dest.selectedSlot = selectedSlot
            }
        }
    }
    
    @IBAction func headSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if !opened {
            opened = true
            selectedSlot = "Head"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    
    @IBAction func chestSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if !opened {
            opened = true
            selectedSlot = "Chest"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func rightSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if !opened {
            opened = true
            selectedSlot = "Shield"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func legsSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if !opened {
            opened = true
            selectedSlot = "Legs"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func accessorySlotPressed(_ sender: UILongPressGestureRecognizer) {
        if !opened {
            opened = true
            selectedSlot = "Accessory"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func leftSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if !opened {
            opened = true
            selectedSlot = "Weapon"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
}

