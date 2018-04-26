//
//  StoreViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/18/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class StoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var storeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeTableView.delegate = self
        storeTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let newCell = storeTableView.dequeueReusableCell(withIdentifier: "storeTableViewCell") as! StoreTableViewCell
        newCell.itemNameLabel.text = "Bread"
        newCell.itemImageView.image = #imageLiteral(resourceName: "bread")
        newCell.itemPriceLabel.text = "5" + "gp"
   
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "selectedItemSegue", sender: self)
    }
    
}
