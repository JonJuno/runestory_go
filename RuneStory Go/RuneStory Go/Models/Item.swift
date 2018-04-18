//
//  Item.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/17/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var image: UIImage
    var name: String
    var type: String
    
    init(named itemName: String, type itemType: String, image itemImage: UIImage) {
        name = itemName
        type = itemType
        image = itemImage
    }
}
