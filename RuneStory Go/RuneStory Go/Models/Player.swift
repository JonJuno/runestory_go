//
//  Player.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class Player {

    var name: String
    var equipped: EquippedItems
    var inventory: [Item]
    var stats: SkillStats
    
    init(named playerName: String) {
        name = playerName
        equipped = EquippedItems()
        inventory = []
        stats = SkillStats()
    }
}
