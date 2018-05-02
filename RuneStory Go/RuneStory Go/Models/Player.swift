//
//  Player.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class Player: NSObject, NSCoding {

    var name: String
    var image: UIImage
    var xp: Int
    var level: Int
    var health: Int
    var coins: Int
    var equipped: EquippedItems
    var inventory: [Item]
    var stats: SkillStats
    var attacks: [Attack]
    
    init(named playerName: String, inventory items: [Item]) {
        name = playerName
        image = #imageLiteral(resourceName: "bob")
        equipped = EquippedItems()
        inventory = items
        stats = SkillStats()
        stats.increaseSkillXP(skillName: "Health", xpEarned: 50)
        health = stats.getSkillLevel(skillName: "Health")!
        attacks = [stab, slash, crush, firebolt]
        coins = 1000
        
        xp = 10
        level = Int(log2(Double(xp))/log2(skillGrowthRate))
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(xp, forKey: "xp")
        aCoder.encode(level, forKey: "level")
        aCoder.encode(health, forKey: "health")
        aCoder.encode(coins, forKey: "coins")
        aCoder.encode(equipped, forKey: "equipped")
        aCoder.encode(inventory, forKey: "inventory")
        aCoder.encode(stats, forKey: "stats")
        aCoder.encode(attacks, forKey: "attacks")
        aCoder.encode(image, forKey: "image")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        coins = aDecoder.decodeInteger(forKey: "coins")
        xp = aDecoder.decodeInteger(forKey: "xp")
        level = aDecoder.decodeInteger(forKey: "level")
        health = aDecoder.decodeInteger(forKey: "health")
        equipped = aDecoder.decodeObject(forKey: "equipped") as! EquippedItems
        inventory = aDecoder.decodeObject(forKey: "inventory") as! [Item]
        stats = aDecoder.decodeObject(forKey: "stats") as! SkillStats
        attacks = aDecoder.decodeObject(forKey: "attacks") as! [Attack]
        image = aDecoder.decodeObject(forKey: "image") as! UIImage
    }
    
    
    /* Inventory Methods */
    
    func getInventory() -> [Item] {
        return inventory
    }
    
    func addToInventory(item: Item) {
        inventory.append(item)
    }
    
    func removeFromInventory(item: Item) -> Bool {
        for i in 0..<inventory.count {
            if (inventory[i].itemId == item.itemId) {
                inventory.remove(at: i)
                return true
            }
        }
        return false
    }
    
    func inventorySize() -> Int {
        return inventory.count
    }
    
    func inventoryItemsOfType(type itemType: String) -> [Item] {
        var toReturn: [Item] = []
        
        for item in inventory {
            if item.type == itemType {
                toReturn.append(item)
            }
        }
        
        return toReturn
    }
    
    func inventoryItem(index: Int) -> Item {
        return inventory[index]
    }
    
    func setInventory(items: [Item]) {
        inventory = items
    }
    
    func clearInventory() {
        inventory = []
    }
    
    /* Equipment Methods */
    func equipItem(itemToEquip: Item) {
        equipped.equip(item: itemToEquip)
    }
    
    func unequipItem(slotToUnequip: String) -> Item? {
        return equipped.unequip(slotToUnequip: slotToUnequip)
    }
    
    func equippedItemsList() -> [Item?]{
        return equipped.items()
    }
    
    func equippedStats(statName: String) -> Int {
        return equipped.equippedStats(stat: statName)
    }
    
    /* Skills Methods */
    func getSkillLevel(skillName: String) -> Int? {
        if let skill = stats.getSkillLevel(skillName: skillName) {
            return skill
        } else {
            return nil
        }
    }
    
    func increaseSkillXP(named: String, amount: Int) {
        stats.increaseSkillXP(skillName: named, xpEarned: amount)
    }
    
    func increaseXP(amount: Int) {
        xp += amount
        level = Int(log2(Double(xp))/log2(skillGrowthRate))
    }
    
    /* Coins Methods */
    func addCoins(amount: Int) {
        coins += amount
    }
    
    func removeCoins(amount: Int) -> Bool {
        if coins - amount >= 0 {
            coins -= amount
            return true
        }
        return false
    }
    
    /* Health Methods */
    
    func getHealth() -> Int {
        return health
    }
    
    func increaseHealth(hitpoints: Int) {
        health += hitpoints
        if health > getSkillLevel(skillName: "Health")! {
            health = getSkillLevel(skillName: "Health")!
        }
    }
    
    func decreaseHealth(hitpoints: Int) {
        health -= hitpoints
        if health < 0 {
            health = 0
        }
    }
}
