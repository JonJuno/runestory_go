//
//  InfoViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/18/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    var selectedItem: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemNameLabel.text = selectedItem.name
        itemDescriptionLabel.text = selectedItem.description
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func buyPressed(_ sender: Any) {
        currPlayer.addToInventory(item: selectedItem.copy())
        dismiss(animated: true, completion: nil)
    }
}
