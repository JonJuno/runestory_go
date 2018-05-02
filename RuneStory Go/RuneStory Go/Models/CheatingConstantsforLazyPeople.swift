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
let itemTypes = ["Weapon", "Shield", "Head", "Chest", "Legs", "Accessory", "Food"]

let daggerDesc = "An ancient dagger made from mysterious Dragon metal. The process used to make it has been lost to history."
let bronzeDesc = "A longsword made from bronze. Simple and effective."
let fireDesc = "A wooden staff embued with the element of fire. Not for use by children under the age of 5."
let runeScimmyDesc = "An exotic sword design from the deserts of Al-Kharid. For expert swordsmen only."
let steelHammerDesc = "A giant block of metal on the end of a stick. Does the job, but definitely not subtle."

let woodenShieldDesc = "A shield made from wooden planks. Slightly more effective than waving your left hand."
let defenderDesc = "An offhand dagger used for parrying. Arrows need not apply."
let addySqShieldDesc = "A small square shield made from Adamant."
let runeKiteDesc = "A large kiteshield made of Rune. Heavy, but should cover most of the body."

let dragonChainDesc = "Chainmail made from Dragon metal. The smiths who forged it have long since disappeared."
let runePlateDesc = "Plate armour made from Rune metal. You wouldn't want to hike with this on."
let leatherBodyDesc = "A simple leather vest to cover the torso. Wear thick clothing underneath for better results."


let runeFullDesc = "A full helmet hammered from Rune metal. Should be fairly sturdy."

let lobsterDesc = "Freshly cooked crustacean. Looks delicious!"
let breadDesc = "Cheap and slightly moldy, but filling."
let superRestoreDesc = "A vigourous concoction that is sure to relieve all your ailments... or kill you."
let beerDesc = "What do you expect? It's just a beer. Red Solo cup not included."

let dragon_dagger = Item(named: "Dragon Dagger", type: "Weapon", desc: daggerDesc, image: #imageLiteral(resourceName: "dagger_dragon"), canConsume: false, attackVal: 20, defenseVal: 0, magicVal: -5, luckVal: 5, healthVal: 0, price: 250)
let bronze_long = Item(named: "Bronze Longsword", type: "Weapon", desc: bronzeDesc, image: #imageLiteral(resourceName: "bronze_longsword"), canConsume: false, attackVal: 5, defenseVal: 0, magicVal: -20, luckVal: 0, healthVal: 0, price: 20)
let fire_staff = Item(named: "Fire Staff", type: "Weapon", desc: fireDesc, image: #imageLiteral(resourceName: "fire_staff"), canConsume: false, attackVal: 5, defenseVal: 5, magicVal: 20, luckVal: 3, healthVal: 0, price: 45)
let rune_scimitar = Item(named: "Rune Scimitar", type: "Weapon", desc: runeScimmyDesc, image: #imageLiteral(resourceName: "rune_scimitar"), canConsume: false, attackVal: 10, defenseVal: 3, magicVal: -10, luckVal: 0, healthVal: 0, price: 150)
let steel_hammer = Item(named: "Steel Warhammer", type: "Weapon", desc: steelHammerDesc, image: #imageLiteral(resourceName: "steel_warhammer"), canConsume: false, attackVal: 8, defenseVal: -2, magicVal: -8, luckVal: 0, healthVal: 0, price: 70)

let wooden_shield = Item(named: "Wooden Shield", type: "Shield", desc: woodenShieldDesc, image: #imageLiteral(resourceName: "wooden_shield"), canConsume: false, attackVal: 0, defenseVal: 4, magicVal: -5, luckVal: 0, healthVal: 0, price: 20)
let dragon_defender = Item(named: "Dragon Defender", type: "Shield", desc: defenderDesc, image: #imageLiteral(resourceName: "dragon_defender"), canConsume: false, attackVal: 5, defenseVal: 8, magicVal: 0, luckVal: 2, healthVal: 0, price: 180)
let addy_sq_shield = Item(named: "Adamant Square Shield", type: "Shield", desc: addySqShieldDesc, image: #imageLiteral(resourceName: "adamant_sq_shield"), canConsume: false, attackVal: -3, defenseVal: 8, magicVal: -8, luckVal: 0, healthVal: 0, price: 100)
let rune_kiteshield = Item(named: "Rune Kiteshield", type: "Shield", desc: runeKiteDesc, image: #imageLiteral(resourceName: "rune_kiteshield"), canConsume: false, attackVal: -5, defenseVal: 10, magicVal: -10, luckVal: 0, healthVal: 0, price: 200)

let dragon_chainbody = Item(named: "Dragon Chainbody", type: "Chest", desc: dragonChainDesc, image: #imageLiteral(resourceName: "dragon_chainbody"), canConsume: false, attackVal: -3, defenseVal: 20, magicVal: -10, luckVal: 2, healthVal: 0, price: 1000)
let rune_platebody = Item(named: "Rune Platebody", type: "Chest", desc: runePlateDesc, image: #imageLiteral(resourceName: "rune_platebody"), canConsume: false, attackVal: -5, defenseVal: 15, magicVal: -15, luckVal: 0, healthVal: 0, price: 400)
let leather_body = Item(named: "Leather Body", type: "Chest", desc: leatherBodyDesc, image: #imageLiteral(resourceName: "leather_body"), canConsume: false, attackVal: 0, defenseVal: 6, magicVal: 0, luckVal: 0, healthVal: 0, price: 50)

let rune_full = Item(named: "Rune Full Helm", type: "Head", desc: runeFullDesc, image: #imageLiteral(resourceName: "rune_full"), canConsume: false, attackVal: -15, defenseVal: 47, magicVal: -20, luckVal: -5, healthVal: 0, price: 300)

let lobster = Item(named: "Lobster", type: "Food", desc: lobsterDesc, image: #imageLiteral(resourceName: "lobster"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 20, price: 15)
let bread = Item(named: "Bread", type: "Food", desc: breadDesc, image: #imageLiteral(resourceName: "bread"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 3, price: 5)
let super_restore = Item(named: "Super Restore", type: "Food", desc: superRestoreDesc, image: #imageLiteral(resourceName: "super_restore"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 0, healthVal: 99, price: 100)
let beer = Item(named: "Beer", type: "Food", desc: beerDesc, image: #imageLiteral(resourceName: "Beer"), canConsume: true, attackVal: 0, defenseVal: 0, magicVal: 0, luckVal: 10, healthVal: 12, price: 5)

/* Attacks */
let stab = Attack(named: "Stab", type: Attack.AttackType.Stab, modifierVal: 1)
let slash = Attack(named: "Slash", type: Attack.AttackType.Slash, modifierVal: 1)
let crush = Attack(named: "Crush", type: Attack.AttackType.Crush, modifierVal: 1)
let firebolt = Attack(named: "Firebolt", type: Attack.AttackType.Magic, modifierVal: 1)

/* Mobs */
let rat = Mob(named: "Giant Rat", withImage: #imageLiteral(resourceName: "giant_rat"), withItems: EquippedItems(), withStats: SkillStats(health: 5, attack: 3, defense: 1, magic: 1, agility: 1, sneak: 1), withDrops: [bread.copy()], withXP: 5)
let skeleton = Mob(named: "Skeleton", withImage: #imageLiteral(resourceName: "skeleton"), withItems: EquippedItems(), withStats: SkillStats(health: 15, attack: 5, defense: 5, magic: 1, agility: 1, sneak: 1), withDrops: [beer.copy()], withXP: 15)
let goblin = Mob(named: "Goblin", withImage: #imageLiteral(resourceName: "goblin"), withItems: EquippedItems(), withStats: SkillStats(health: 8, attack: 4, defense: 2, magic: 1, agility: 1, sneak: 1), withDrops: [wooden_shield.copy()], withXP: 10)
let mobPopulation = [rat, skeleton, goblin]

/* Store Items */
let storeItems = [bronze_long.copy(), rune_scimitar.copy(), fire_staff.copy(), wooden_shield.copy(), addy_sq_shield.copy(), rune_kiteshield.copy(), leather_body.copy(), rune_full.copy(), bread.copy(), beer.copy(), lobster.copy()]

/* Initialization of Player Bob */
var currPlayer: Player!
var avatars = [#imageLiteral(resourceName: "bob"), #imageLiteral(resourceName: "realbob"), #imageLiteral(resourceName: "woman"), #imageLiteral(resourceName: "barbarian"), #imageLiteral(resourceName: "ceril"), #imageLiteral(resourceName: "horacio"), #imageLiteral(resourceName: "leela"), #imageLiteral(resourceName: "expert"), #imageLiteral(resourceName: "habibah")]

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
