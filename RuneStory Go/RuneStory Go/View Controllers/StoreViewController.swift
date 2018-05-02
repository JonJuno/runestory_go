//
//  StoreViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/18/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class StoreViewController: RuneStoryGoUIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var buysellSwitch: UISwitch!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    
    var storeModel: Store!
    var selectedItem: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeTableView.delegate = self
        storeTableView.dataSource = self
        
        storeModel = Store(itemsToSell: storeItems)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemDescriptionLabel.text = "No item selected."
        selectedItem = nil
        buyButton.tintColor = greyInvalidColor
        buyButton.isEnabled = false
        redraw()
    }
    
    func redraw() {
        coinsLabel.text = String(describing: currPlayer.coins) + " gp"
        storeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if buysellSwitch.isOn {
            return currPlayer.getInventory().count
        } else {
            return storeModel.getItems().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let newCell = storeTableView.dequeueReusableCell(withIdentifier: "storeTableViewCell") as! StoreTableViewCell
        let item: Item
        
        if buysellSwitch.isOn {
            item = currPlayer.getInventory()[indexPath.item]
        } else {
            item = storeModel.getItems()[indexPath.item]
        }
        
        newCell.itemNameLabel.text = item.name
        newCell.itemImageView.image = item.image
        newCell.itemPriceLabel.text = String(describing: item.cost) + " gp"
   
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if buysellSwitch.isOn {
            selectedItem = currPlayer.getInventory()[indexPath.item]
        } else {
            selectedItem = storeModel.getItems()[indexPath.item]
        }
        
        itemDescriptionLabel.text = selectedItem.desc
        buyButton.tintColor = blueButtonColor
        buyButton.isEnabled = true
    }
    
    @IBAction func buyPressed(_ sender: Any) {
        if let item = selectedItem {
            if buysellSwitch.isOn {
                if !storeModel.sellItem(currPlayer: currPlayer, item: selectedItem) {
                    let alert = UIAlertController(title: "Item doesn't exist!", message: "Hey, what are you trying to pull? Don't come back without the goods!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Sorry", style: UIAlertActionStyle.default, handler: {_ in
                        self.redraw()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                if storeModel.buyItem(currPlayer: currPlayer, named: item.name) == false {
                    let alert = UIAlertController(title: "Not Enough Coins!", message: "Hey, what are you trying to pull? Don't come back unless you have the coin!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Sorry", style: UIAlertActionStyle.default, handler: {_ in
                        self.redraw()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        self.redraw()
    }
    
    @IBAction func buysellChanged(_ sender: Any) {
        storeTableView.reloadData()
        selectedItem = nil
        itemDescriptionLabel.text = "No item selected."
        buyButton.tintColor = greyInvalidColor
        buyButton.isEnabled = false
        
        if buysellSwitch.isOn {
            self.buyButton.setTitle("Sell", for: UIControlState.normal)
        } else {
            self.buyButton.setTitle("Buy", for: UIControlState.normal)
        }
    }
    
}
