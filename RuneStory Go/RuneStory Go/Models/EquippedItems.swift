//
//  EquippedItems.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class EquippedItems {
    
    var head_item: Item?
    var chest_item: Item?
    var legs_item: Item?
    var left_item: Item?
    var right_item: Item?
    var accessory_item: Item?
    
    func items() -> [Item?] {
        return [head_item, chest_item, legs_item, left_item, right_item, accessory_item]
    }
    
    func equippedStats(stat: String) -> Int {
        var valToReturn = 0
        for item in items() {
            if let safeItem = item {
                switch stat {
                    case "Attack": valToReturn += safeItem.attackBuff
                    case "Defense": valToReturn += safeItem.defenseBuff
                    case "Magic": valToReturn += safeItem.magicBuff
                    case "Luck": valToReturn += safeItem.luckBuff
                    default: valToReturn += 0
                }
            }
        }
        
        return valToReturn
    }
    
    /* Equips given item to appropriate slot. Error if item is not equippable */
    func equip(item: Item) {
        switch item.type {
            case "Weapon": left_item = item
            case "Shield": right_item = item
            case "Head": head_item = item
            case "Chest": chest_item = item
            case "Legs": legs_item = item
            case "Accessory": accessory_item = item
            default: print("Can't Equip That!")
        }
    }
    
    func unequip(slotToUnequip: String) -> Item? {
        
        var itemToReturn: Item?
        
        switch slotToUnequip {
            case "Weapon":
                itemToReturn = left_item
                left_item = nil
            case "Shield":
                itemToReturn = right_item
                right_item = nil
            case "Head":
                itemToReturn = head_item
                head_item = nil
            case "Chest":
                itemToReturn = chest_item
                chest_item = nil
            case "Legs":
                itemToReturn = legs_item
                legs_item = nil
            case "Accessory":
                itemToReturn = accessory_item
                accessory_item = nil
            default:
                itemToReturn = nil
        }
        
        return itemToReturn
    }
    
}
