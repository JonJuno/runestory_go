//
//  EquipSelectTableViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class EquipSelectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var equipSelectTableView: UITableView!
    
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newCell = equipSelectTableView!.dequeueReusableCell(withIdentifier: "equipSelectTableViewCell") as! EquipSelectTableViewCell
        
        newCell.equipSelectImageView?.image = UIImage(named: "rune_full")
        newCell.equipSelectNameLabel?.text = "Rune Full Helm"
        
        return newCell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        dismiss(animated: true, completion: nil)
//    }
    
}
