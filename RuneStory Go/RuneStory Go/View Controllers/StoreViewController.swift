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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeModel.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let newCell = storeTableView.dequeueReusableCell(withIdentifier: "storeTableViewCell") as! StoreTableViewCell
        let item = storeModel.getItems()[indexPath.item]
        newCell.itemNameLabel.text = item.name
        newCell.itemImageView.image = item.image
        newCell.itemPriceLabel.text = String(describing: item.cost) + " gp"
   
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = storeModel.getItems()[indexPath.item]
        itemDescriptionLabel.text = selectedItem.desc
        buyButton.tintColor = blueButtonColor
        buyButton.isEnabled = true
    }
    
    @IBAction func buyPressed(_ sender: Any) {
        if let item = selectedItem {
            if storeModel.buyItem(currPlayer: currPlayer, named: item.name) == false {
                let alert = UIAlertController(title: "Not Enough Coins!", message: "Hey, what are you trying to pull? Don't come back unless you have the coin!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        redraw()
    }
    
}
