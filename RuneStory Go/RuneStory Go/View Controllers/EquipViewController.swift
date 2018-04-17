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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

