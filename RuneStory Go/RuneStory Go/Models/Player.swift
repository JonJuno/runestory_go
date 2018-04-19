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
    var level: Int
    var equipped: EquippedItems
    var inventory: [Item]
    var stats: SkillStats
    
    init(named playerName: String, inventory items: [Item]) {
        name = playerName
        level = 3
        equipped = EquippedItems()
        inventory = items
        stats = SkillStats()
    }
    
    /* Inventory Methods */
    
    func addToInventory(item: Item) {
        inventory.append(item)
    }
    
    func removeFromInventory(item: Item) {
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
    
    /* Skills Methods */
    func getSkillLevel(skillName: String) -> Int? {
        if let skill = stats.getSkillLevel(skillName: skillName) {
            return skill
        } else {
            return nil
        }
    }
}
