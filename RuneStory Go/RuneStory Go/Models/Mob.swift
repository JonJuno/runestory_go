//
//  Mob.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/19/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class Mob: Hashable {
    
    var hashValue: Int

    var name: String
    var health: Int
    var image: UIImage
    var equipped: EquippedItems
    var stats: SkillStats
    var xp: Int
    var drops: [Item]
    var mobId: String
    
    init (named: String, withImage: UIImage, withItems: EquippedItems, withStats: SkillStats, withDrops: [Item], withXP: Int) {
        name = named
        image = withImage
        equipped = withItems
        stats = withStats
        drops = withDrops
        xp = withXP
        health = withStats.getSkillLevel(skillName: "Health")!
        mobId = UUID().uuidString
        hashValue = mobId.hashValue
    }
    
    static func ==(lhs: Mob, rhs: Mob) -> Bool {
        return lhs.mobId == rhs.mobId
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
