//
//  EquipViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import UIKit

class EquipViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* replace images with what user currently has equipped */
        fillEquipment()
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
    
    @IBAction func headSlotPressed(_ sender: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "equipTableSelectSegue", sender: self)
    }
    
}

