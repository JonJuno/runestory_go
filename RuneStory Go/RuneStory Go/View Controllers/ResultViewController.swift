//
//  ResultViewController.swift
//  RuneStory Go
//
//  Unused
//
//  Created by Johnny Le on 4/19/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: RuneStoryGoUIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var battleResultLabel: UILabel!
    @IBOutlet weak var inventoryChangesLabel: UILabel!
    @IBOutlet weak var itemsTableView: UITableView!
    
    var enemyMob: Mob!
    var won: Bool!
    
    var items: [Item]!
    var skill: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        
        if won {
            items = calcItemsGained()
            skill = calcSkillGained()
            battleResultLabel.text = "Victory!"
            inventoryChangesLabel.text = "You received " + String(describing: skill!) + " experience and:"
        } else {
            items = calcItemsLost()
            battleResultLabel.text = "Defeat!"
            inventoryChangesLabel.text = "You lost:"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let count = items.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @IBAction func okayButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToActionViewController", sender: self)
    }
    
    func calcSkillGained() -> Int{
        return enemyMob.xp
    }
    
    func calcItemsGained() -> [Item] {
        return enemyMob.drops
    }
    
    func calcItemsLost() -> [Item] {
        var lost:[Item] = []
        
        for item in currPlayer.getInventory() {
            if (arc4random_uniform(UInt32(10 * currPlayer.equippedStats(statName: "Luck"))) == 0) {
                lost.append(item)
            }
        }
        
        return lost
    }
}
