//
//  Attack.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/26/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class Attack {
    
    enum AttackType {
        case Stab
        case Slash
        case Crush
        case Magic
    }
    
    var name: String
    var attackType: AttackType
    var attackModifier: Int
    
    init(named: String, type: AttackType, modifierVal: Int) {
        name = named
        attackType = type
        attackModifier = modifierVal
    }
}
