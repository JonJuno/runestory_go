//
//  Store.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/26/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class Store {
    
    var items: [String: Item]
    
    init (itemsToSell: [Item]) {
        items = [:]
        for item in itemsToSell {
            items[item.name] = item.copy()
        }
    }
    
    func getItems() -> [Item] {
        return Array(items.values)
    }
    
    func buyItem(currPlayer:Player, named: String) -> Bool {
        if let item = items[named] {
            if currPlayer.removeCoins(amount: item.cost) {
                currPlayer.addToInventory(item: item.copy())
                return true
            }
        }
        return false
    }
    
    func sellItem(currPlayer:Player, item: Item) -> Bool {
        if currPlayer.removeFromInventory(item: item) {
            currPlayer.addCoins(amount: item.cost)
            return true
        }
        return false
    }
}
