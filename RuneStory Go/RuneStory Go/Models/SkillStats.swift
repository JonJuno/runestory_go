//
//  SkillStats.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class SkillStats: NSObject, NSCoding {

    var statLevels: [String:Int]
    var statXPs: [String:Int]
    
    override init() {
        statLevels = [:]
        statXPs = [:]
        
        for i in 0..<skillNames.count {
            statXPs[skillNames[i]] = 10;
            statLevels[skillNames[i]] = Int(log2(Double(10))/log2(skillGrowthRate));
        }
    }
    
    init(health: Int, attack: Int, defense: Int, magic: Int, agility: Int, sneak: Int) {
        statXPs = [:]
        statLevels = [:]
        statXPs["Health"] = health
        statLevels["Health"] = Int(log2(Double(statXPs["Health"]!))/log2(skillGrowthRate));
        statXPs["Attack"] = attack
        statLevels["Attack"] = Int(log2(Double(statXPs["Attack"]!))/log2(skillGrowthRate));
        statXPs["Defense"] = defense
        statLevels["Defense"] = Int(log2(Double(statXPs["Defense"]!))/log2(skillGrowthRate));
        statXPs["Magic"] = magic
        statLevels["Magic"] = Int(log2(Double(statXPs["Magic"]!))/log2(skillGrowthRate));
        statXPs["Agility"] = agility
        statLevels["Agility"] = Int(log2(Double(statXPs["Agility"]!))/log2(skillGrowthRate));
        statXPs["Sneak"] = sneak
        statLevels["Sneak"] = Int(log2(Double(statXPs["Sneak"]!))/log2(skillGrowthRate));
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(statLevels, forKey: "levels")
        aCoder.encode(statXPs, forKey: "xps")
    }
    
    required init?(coder aDecoder: NSCoder) {
        statLevels = aDecoder.decodeObject(forKey: "levels") as! [String:Int]
        statXPs = aDecoder.decodeObject(forKey: "xps") as! [String:Int]
    }
    
    func copy() -> SkillStats {
        return SkillStats(health: statXPs["Health"]!, attack: statXPs["Attack"]!, defense: statXPs["Defense"]!, magic: statXPs["Magic"]!, agility: statXPs["Agility"]!, sneak: statXPs["Sneak"]!)
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
