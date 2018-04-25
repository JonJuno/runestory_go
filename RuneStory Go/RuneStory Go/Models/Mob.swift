//
//  Mob.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/19/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class Mob {

    var name: String
    var health: Int
    var image: UIImage
    var equipped: EquippedItems
    var stats: SkillStats
    var xp: Int
    var drops: [Item]
    
    init (named: String, withImage: UIImage, withItems: EquippedItems, withStats: SkillStats, withDrops: [Item], withXP: Int) {
        name = named
        image = withImage
        equipped = withItems
        stats = withStats
        drops = withDrops
        xp = withXP
        health = withStats.getSkillLevel(skillName: "Health")!
        
    }
    
    func equippedStats(statName: String) -> Int {
        return equipped.equippedStats(stat: statName)
    }
    
    func getSkillLevel(skillName: String) -> Int {
        return stats.getSkillLevel(skillName: skillName)!
    }
    
    func getHealth() -> Int {
        return health
    }
    
    func increaseHealth(hitpoints: Int) {
        health += hitpoints
    }
    
    func decreaseHealth(hitpoints: Int) {
        health -= hitpoints
        if health < 0 {
            health = 0
        }
    }
}
