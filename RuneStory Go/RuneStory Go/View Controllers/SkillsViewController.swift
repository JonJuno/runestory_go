//
//  SkillsViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class SkillsViewController: RuneStoryGoUIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLevelLabel: UILabel!
    
    @IBOutlet weak var skillsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        skillsTableView.delegate = self
        skillsTableView.dataSource = self
        
        setupCharData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return skillNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newCell = skillsTableView.dequeueReusableCell(withIdentifier: "skillsTableViewCell") as! SkillsTableViewCell
        
        newCell.skillImageView.image = skillImages[indexPath.item]
        newCell.skillNameLabel.text = skillNames[indexPath.item]
        
        if let skillLevel = currPlayer.getSkillLevel(skillName: skillNames[indexPath.item]) {
            newCell.skillLevelLabel.text = String(describing: skillLevel) + "/" + String(describing: skillLevel)
        }
        
        return newCell
    }
    
    func setupCharData() {
        userAvatarImageView.image = UIImage(named: "bob")
        userNameLabel.text = currPlayer.name
        userLevelLabel.text = "Level " + String(currPlayer.level)
    }
}
