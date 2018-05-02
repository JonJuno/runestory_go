//
//  Item.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class Item: NSObject, NSCoding {
    
    var image: UIImage
    var name: String
    var desc: String
    var type: String
    
    var consumable: Bool
    
    var attackBuff: Int
    var defenseBuff: Int
    var magicBuff: Int
    var luckBuff: Int
    var healthRestore: Int
    var cost: Int
    
    var itemId: String
    
    init(named itemName: String, type itemType: String, desc: String, image itemImage: UIImage, canConsume: Bool, attackVal: Int, defenseVal: Int, magicVal: Int, luckVal: Int, healthVal: Int, price: Int) {
        
        name = itemName
        type = itemType
        image = itemImage
        self.desc = desc
        
        consumable = canConsume
        
        attackBuff = attackVal
        defenseBuff = defenseVal
        magicBuff = magicVal
        luckBuff = luckVal
        healthRestore = healthVal
        cost = price
        
        itemId = UUID().uuidString
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: "image")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(desc, forKey: "desc")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(consumable, forKey: "consume")
        aCoder.encode(attackBuff, forKey: "attack")
        aCoder.encode(defenseBuff, forKey: "defense")
        aCoder.encode(magicBuff, forKey: "magic")
        aCoder.encode(luckBuff, forKey: "luck")
        aCoder.encode(healthRestore, forKey: "health")
        aCoder.encode(cost, forKey: "cost")
        aCoder.encode(itemId, forKey: "id")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        image = aDecoder.decodeObject(forKey: "image") as! UIImage
        desc = aDecoder.decodeObject(forKey: "desc") as! String
        type = aDecoder.decodeObject(forKey: "type") as! String
        itemId = aDecoder.decodeObject(forKey: "id") as! String
        consumable = aDecoder.decodeBool(forKey: "consume")
        cost = aDecoder.decodeInteger(forKey: "cost")
        attackBuff = aDecoder.decodeInteger(forKey: "attack")
        defenseBuff = aDecoder.decodeInteger(forKey: "defense")
        magicBuff = aDecoder.decodeInteger(forKey: "magic")
        luckBuff = aDecoder.decodeInteger(forKey: "luck")
        healthRestore = aDecoder.decodeInteger(forKey: "health")
    }
    
    
    func copy() -> Item {
        return Item(named: name, type: type, desc: desc, image: image, canConsume: consumable, attackVal: attackBuff, defenseVal: defenseBuff, magicVal: magicBuff, luckVal: luckBuff, healthVal: healthRestore, price: cost)
    }
}
