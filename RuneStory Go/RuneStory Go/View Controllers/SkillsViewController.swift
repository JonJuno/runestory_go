//
//  SkillsViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class SkillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLevelLabel: UILabel!
    @IBOutlet weak var userNextXPLabel: UILabel!
    
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
        newCell.skillLevelLabel.text = "1/1"
        
        return newCell
    }
    
    func setupCharData() {
        userAvatarImageView.image = UIImage(named: "bob")
        userNameLabel.text = "Bob"
        userLevelLabel.text = "Level 3"
        userNextXPLabel.text = "266 XP until Next Level"
    }
}
