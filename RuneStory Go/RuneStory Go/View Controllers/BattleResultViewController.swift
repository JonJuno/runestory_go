//
//  BattleResultViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/25/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class BattleResultViewController: RuneStoryGoUIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var battleResultLabel: UILabel!
    @IBOutlet weak var winLossLabel: UILabel!
    @IBOutlet weak var resultTableView: UITableView!
    
    var enemyMob: Mob!
    var won: Bool!
    var items: [Item]!
    var skill: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        if won {
            items = calcItemsGained()
            skill = calcSkillGained()
            battleResultLabel.text = "Victory!"
            winLossLabel.text = "You received " + String(describing: skill!) + " experience and:"
        } else {
            items = calcItemsLost()
            battleResultLabel.text = "Defeat!"
            winLossLabel.text = "You lost:"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = resultTableView.dequeueReusableCell(withIdentifier: "changedItemCell") as! ChangedItemsTableViewCell
        let item = items[indexPath.item]
        newCell.itemImageView.image = item.image
        newCell.itemNameLabel.text = item.name
        return newCell
    }
    
    @IBAction func okayButtonPressed(_ sender: Any) {
        if won {
            currPlayer.increaseXP(amount: skill)
            for item in items {
                currPlayer.addToInventory(item: item.copy())
            }
        } else {
            for item in items {
                if currPlayer.removeFromInventory(item: item) == false {
                    print("Uhhh, that shouldn't have happened...")
                }
            }
        }
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
            if (arc4random_uniform(UInt32(10 * (currPlayer.equippedStats(statName: "Luck") + 1))) == 0) {
                lost.append(item)
            }
        }
        
        return lost
    }
    
}
