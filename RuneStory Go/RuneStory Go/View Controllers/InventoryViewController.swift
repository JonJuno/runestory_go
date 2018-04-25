//
//  InventoryViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class InventoryViewController: RuneStoryGoUIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var InventoryCollectionView: UICollectionView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var useItemButton: UIButton!
    
    var blueButtonColor: UIColor!
    var selectedItem: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        InventoryCollectionView.delegate = self
        InventoryCollectionView.dataSource = self
        blueButtonColor = self.view.tintColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        InventoryCollectionView.reloadData()
        itemNameLabel.text = "No Item Selected"
        useItemButton.isEnabled = false
        useItemButton.tintColor = UIColor.lightGray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func useItemButtonPressed(_ sender: Any) {
        currPlayer.increaseHealth(hitpoints: selectedItem.healthRestore)
        currPlayer.removeFromInventory(item: selectedItem)
        InventoryCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currPlayer.inventorySize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCollectionCell", for: indexPath) as! InventoryCollectionViewCell
        
        newCell.ItemImageView.image = currPlayer.inventoryItem(index: indexPath.item).image
    
        return newCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = currPlayer.inventoryItem(index: indexPath.item)
        
        itemNameLabel.text = selectedItem.name
        if (selectedItem.consumable) {
            useItemButton.isEnabled = true
            useItemButton.tintColor = blueButtonColor
        } else {
            useItemButton.isEnabled = false
            useItemButton.tintColor = UIColor.lightGray
        }
    }
    
}
