//
//  RuneStoryGoUIViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/18/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class RuneStoryGoUIViewController: UIViewController {
    
    var blueButtonColor: UIColor!
    var greyInvalidColor: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueButtonColor = self.view.tintColor
        greyInvalidColor = UIColor.lightGray
        
        /* set default background color to grey */
//        self.view.backgroundColor = UIColor.darkGray
    }
}
