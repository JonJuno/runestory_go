//
//  SkillStats.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class SkillStats {
    
    var statLevels: [String:Int]
    var statXPs: [String:Int]
    
    init() {
        statLevels = [:]
        statXPs = [:]
        
        for i in 0..<skillNames.count {
            statLevels[skillNames[i]] = 1;
            statXPs[skillNames[i]] = 0;
        }
    }
    
    func calcNextSkillLevelXP(skillLevel: Int) -> Int {
        return skillLevel * 100 + Int(truncating: pow(2, skillLevel) as NSDecimalNumber)
    }
    
    func increaseSkillLevel(skillName: String) {
        if var skillLevel = statLevels[skillName] {
            skillLevel += 1
        }
    }
    
    func getSkillLevel(skillName: String) -> Int? {
        if let skillLevel = statLevels[skillName] {
            return skillLevel
        } else {
            return nil
        }
    }
    
    func increaseSkillXP(skillName: String, xpEarned: Int) {
        if var skillXP = statXPs[skillName] {
            skillXP += xpEarned
            if skillXP >= calcNextSkillLevelXP(skillLevel: statLevels[skillName]!) {
                increaseSkillLevel(skillName: skillName)
            }
        }
    }
    
    func getSkillXP(skillName: String) -> Int? {
        if let skillXP = statXPs[skillName] {
            return skillXP
        } else {
            return nil
        }
    }
}
