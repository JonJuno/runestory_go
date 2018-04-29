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
let combatSkills = ["Health", "Attack", "Defense", "Magic"]
let skillGrowthRate = 1.5

/* Item-related Constants */
let itemTypes = ["Weapon", "Shield", "Head", "Chest", "Legs", "Accessory", "Food", "Potion", "Coins"]

let daggerDesc = "An ancient dagger made from mysterious Dragon metal. The process used to make it has been lost to history."
let lobsterDesc = "Freshly cooked crustacean. Looks delicious!"
let runeFullDesc = "A full helmet hammered from Rune metal. Sturdier than a brick outhouse."
let breadDesc = "Cheap and slightly moldy, but filling."

let dagger = Item(named: "Dragon Dagger", type: "Weapon", desc: daggerDesc, image: #imageLiteral(resourceName: "dagger_dragon"), canConsume: false, attackVal: 20, defenseVal: 0, magicVal: -5, luckVal: 5, healthVal: 0, price: 100)
let lobster = Item(named: "Lobster", type: "Food", desc: lobsterDesc, image: #imageLiteral(resourceName: "lobster"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 20, price: 15)
let lobsterDrop = Item(named: "Lobster", type: "Food", desc: lobsterDesc, image: #imageLiteral(resourceName: "lobster"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 20, price: 15)
let rune_full = Item(named: "Rune Full Helm", type: "Head", desc: runeFullDesc, image: #imageLiteral(resourceName: "rune_full"), canConsume: false, attackVal: -15, defenseVal: 47, magicVal: -20, luckVal: -5, healthVal: 0, price: 500)
let bread = Item(named: "Bread", type: "Food", desc: breadDesc, image: #imageLiteral(resourceName: "bread"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 3, price: 5)

/* Attacks */
let stab = Attack(named: "Stab", type: Attack.AttackType.Stab, modifierVal: 1)
let slash = Attack(named: "Slash", type: Attack.AttackType.Slash, modifierVal: 1)
let crush = Attack(named: "Crush", type: Attack.AttackType.Crush, modifierVal: 1)
let firebolt = Attack(named: "Firebolt", type: Attack.AttackType.Magic, modifierVal: 1)

/* Store Items */
let storeItems = [lobster, bread, rune_full, dagger]

/* Initialization of Player Bob */
var Bob = Player(named: "Bob", inventory: [dagger.copy(), lobster.copy(), rune_full.copy(), rune_full.copy(), lobster.copy(), dagger.copy()])
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
