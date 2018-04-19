//
//  QuestInfoViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/18/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class QuestInfoViewController: UIViewController {

    @IBOutlet weak var questNameLabel: UILabel!
    @IBOutlet weak var questInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
