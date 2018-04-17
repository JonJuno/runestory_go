//
//  InventoryViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class InventoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var InventoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        InventoryCollectionView.delegate = self
        InventoryCollectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // TODO: Implement Model for Inventory
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCollectionCell", for: indexPath) as! InventoryCollectionViewCell
        
        // Include some images here
        // newCell.ItemImageView.image = UIImage()
    
        return newCell
    }
    
}
