//
//  Item.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var image: UIImage
    var name: String
    var type: String
    
    var consumable: Bool
    
    var attackBuff: Int
    var defenseBuff: Int
    var magicBuff: Int
    var luckBuff: Int
    var healthRestore: Int
    
    var itemId: String
    
    init(named itemName: String, type itemType: String, image itemImage: UIImage, canConsume: Bool, attackVal: Int, defenseVal: Int, magicVal: Int, luckVal: Int, healthVal: Int) {
        
        name = itemName
        type = itemType
        image = itemImage
        
        consumable = canConsume
        
        attackBuff = attackVal
        defenseBuff = defenseVal
        magicBuff = magicVal
        luckBuff = luckVal
        healthRestore = healthVal
        
        itemId = UUID().uuidString
    }
}
