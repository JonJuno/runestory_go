//
//  Attack.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/26/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class Attack: NSObject, NSCoding {
    
    enum AttackType : String {
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(attackType.rawValue, forKey: "type")
        aCoder.encode(attackModifier, forKey: "modifier")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        attackType = AttackType(rawValue: aDecoder.decodeObject(forKey: "type") as! String)!
        attackModifier = aDecoder.decodeInteger(forKey: "modifier")
    }
}
