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
            statXPs[skillNames[i]] = 10;
            statLevels[skillNames[i]] = calcLevelForXP(xp: statXPs[skillNames[i]]!);
        }
    }
    
    func calcLevelForXP(xp: Int) -> Int {
        return Int(log2(Double(xp))/log2(skillGrowthRate))
    }
    
    func setSkillLevel(skillName: String, value: Int) {
        statLevels[skillName] = value
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
            setSkillLevel(skillName: skillName, value: calcLevelForXP(xp: skillXP))
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
