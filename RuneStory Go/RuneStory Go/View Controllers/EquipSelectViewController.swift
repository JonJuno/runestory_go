//
//  EquipSelectTableViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class EquipSelectViewController: RuneStoryGoUIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var equipSelectTableView: UITableView!
    var selectedSlot: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        equipSelectTableView.delegate = self
        equipSelectTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currPlayer.inventoryItemsOfType(type: selectedSlot!).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newCell = equipSelectTableView!.dequeueReusableCell(withIdentifier: "equipSelectTableViewCell") as! EquipSelectTableViewCell
        
        let item = currPlayer.inventoryItemsOfType(type: selectedSlot!)[indexPath.item]
        newCell.equipSelectImageView?.image = item.image
        newCell.equipSelectNameLabel?.text = item.name
        
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = currPlayer.inventoryItemsOfType(type: selectedSlot!)[indexPath.item]
        
        if let removedItem = currPlayer.unequipItem(slotToUnequip: selectedSlot!) {
            currPlayer.addToInventory(item: removedItem)
        }
        currPlayer.equipItem(itemToEquip: item)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
