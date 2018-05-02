//
//  Battle.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/19/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class Battle {
    
    var mob: Mob
    var phase: BattlePhase
    
    enum BattlePhase {
        case Started
        case PlayerAttack
        case MobAttack
        case Finished
    }
    
    init (enemyMob: Mob) {
        mob = enemyMob
        phase = BattlePhase.Started
    }
    
    func getPhase() -> BattlePhase {
        return phase
    }
    
    func startBattle() {
        phase = BattlePhase.PlayerAttack
    }
    
    func advanceBattle(currPlayer: Player) -> Int {
        var damage = 0
        
        if phase == BattlePhase.PlayerAttack {
            damage = calcDamage(attackVal: currPlayer.equippedStats(statName: "Attack"), attackSkill: currPlayer.getSkillLevel(skillName: "Attack")!, luckVal: currPlayer.equippedStats(statName: "Luck"), defenseVal: mob.equippedStats(statName: "Defense"), defenseSkill: mob.getSkillLevel(skillName: "Defense"))
            mob.decreaseHealth(hitpoints: damage)
            currPlayer.increaseSkillXP(named: "Attack", amount: Int(Double(damage)/skillGrowthRate))
        } else if phase == BattlePhase.MobAttack {
            damage = calcDamage(attackVal: mob.equippedStats(statName: "Attack"), attackSkill: mob.getSkillLevel(skillName: "Attack"), luckVal: mob.equippedStats(statName: "Luck"), defenseVal: currPlayer.equippedStats(statName: "Defense"), defenseSkill: currPlayer.getSkillLevel(skillName: "Defense")!)
            currPlayer.decreaseHealth(hitpoints: damage)
            currPlayer.increaseSkillXP(named: "Defense", amount: Int(Double(damage)/skillGrowthRate))
        }
        
        if (mob.getHealth() == 0 || currPlayer.getHealth() == 0) {
            phase = BattlePhase.Finished
        } else if phase == BattlePhase.PlayerAttack {
            phase = BattlePhase.MobAttack
        } else {
            phase = BattlePhase.PlayerAttack
        }
        
        return damage
    }
    
    func calcDamage(attackVal: Int, attackSkill: Int, luckVal: Int, defenseVal: Int, defenseSkill: Int) -> Int {
        let trueDamage = attackVal + Int(0.1 * Double(attackSkill)) + Int(0.1 * Double(arc4random_uniform(UInt32(luckVal))))
        let trueDefense = defenseVal + Int(0.1 * Double(defenseSkill))
        let netDamage = trueDamage - trueDefense
        
        if netDamage < 0 {
            return 0 // ensures no negative damage
        } else {
            return netDamage
        }
    }
}
