//
//  CheatingConstantsforLazyPeople.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

/* Skills-related Constants */
let skillNames = ["Health", "Attack", "Defense", "Magic", "Agility", "Sneak"]
let skillImages = [UIImage(named: "health"), UIImage(named: "attack"), UIImage(named: "defense"), UIImage(named: "magic"), UIImage(named: "agility"), UIImage(named: "sneak")]

/* Item-related Constants */
let itemTypes = ["Weapon", "Shield", "Head", "Chest", "Legs", "Accessory", "Food", "Potion", "Coins"]

let dagger = Item(named: "Dragon Dagger", type: "Weapon", image: #imageLiteral(resourceName: "dagger_dragon"), canConsume: false, attackVal: 5, defenseVal: 0, magicVal: -5, luckVal: 5, healthVal: 0)
let lobster = Item(named: "Lobster", type: "Food", image: #imageLiteral(resourceName: "lobster"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 20)
let lobsterDrop = Item(named: "Lobster", type: "Food", image: #imageLiteral(resourceName: "lobster"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 20)
let rune_full = Item(named: "Rune Full Helm", type: "Head", image: #imageLiteral(resourceName: "rune_full"), canConsume: false, attackVal: -15, defenseVal: 47, magicVal: -20, luckVal: -5, healthVal: 0)

/* Initialization of Player Bob */
var Bob = Player(named: "Bob", inventory: [dagger, lobster, rune_full, rune_full, lobster, dagger])
var currPlayer = Bob

/* Battle-text Generators */
func genEncounterText(enemy: String) -> String {
    return "You are being attacked by a " + enemy + "!"
}

func genAttackText(target: String, damage: Int) -> String {
    return "You hit " + target + " for " + String(describing: damage) + " damage!"
}

func genDamagedText(enemy: String, damage: Int) -> String {
    return enemy + " hit you for " + String(describing: damage) + " damage!"
}
