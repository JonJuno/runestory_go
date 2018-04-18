//
//  SkillStats.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation

class SkillStats {
    
    var stats: [String:Int]
    
    init() {
        stats = [:]
        
        for i in 0...skillNames.count {
            stats[skillNames[i]] = 1;
        }
    }
}
