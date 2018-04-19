//
//  QuestViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/18/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class QuestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questsTableView.delegate = self
        questsTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let newCell = questsTableView.dequeueReusableCell(withIdentifier: "questsTableViewCell") as! QuestsTableViewCell
        newCell.questTitleLabel.text = "Defeat 10 Skeletons around Ardougne"
   
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "selectedQuestSegue", sender: self)
    }
    
}
