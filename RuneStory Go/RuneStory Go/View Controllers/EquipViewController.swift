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

    @IBOutlet weak var attackStatsLabel: UILabel!
    @IBOutlet weak var defenseStatsLabel: UILabel!
    @IBOutlet weak var magicStatsLabel: UILabel!
    @IBOutlet weak var luckStatsLabel: UILabel!
    
    var selectedSlot: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /* replace images with what user currently has equipped */
        fillEquipment()
        calcEquipmentStats()
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
    }
    
    func calcEquipmentStats() {
        var attackVal = 0
        var defenseVal = 0
        var magicVal = 0
        var luckVal = 0
        
        for item in currPlayer.equippedItemsList() {
            if let safeItem = item {
                attackVal += safeItem.attackBuff
                defenseVal += safeItem.defenseBuff
                magicVal += safeItem.magicBuff
                luckVal += safeItem.luckBuff
            }
        }
        
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
        if sender.state != UIGestureRecognizerState.began {
            selectedSlot = "Head"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    
    @IBAction func chestSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began {
            selectedSlot = "Chest"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func rightSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began {
            selectedSlot = "Shield"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func legsSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began {
            selectedSlot = "Legs"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func accessorySlotPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began {
            selectedSlot = "Accessory"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
    @IBAction func leftSlotPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began {
            selectedSlot = "Weapon"
            performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
        }
    }
}

