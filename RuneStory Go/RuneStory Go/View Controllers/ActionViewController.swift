//
//  ActionViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import UIKit

class ActionViewController: RuneStoryGoUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if id == "beginBattleSegue" {
                let dest = segue.destination as! BattleViewController
                let ratStats = SkillStats()
                ratStats.setSkillLevel(skillName: "Attack", value: 20)
                ratStats.setSkillLevel(skillName: "Defense", value: 1)
                ratStats.setSkillLevel(skillName: "Magic", value: 1)
                ratStats.setSkillLevel(skillName: "Health", value: 20)
                dest.battleModel = Battle(enemyMob: Mob(named: "Giant Rat", withImage: #imageLiteral(resourceName: "giant_rat"), withItems: EquippedItems(), withStats: ratStats, withDrops: [lobsterDrop], withXP: 10))
            }
        }
    }

}

