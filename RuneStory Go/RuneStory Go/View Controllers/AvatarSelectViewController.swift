//
//  AvatarSelectViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 5/1/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class AvatarSelectViewController: RuneStoryGoUIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var avatarSelectCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarSelectCollectionView.delegate = self
        avatarSelectCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = avatarSelectCollectionView.dequeueReusableCell(withReuseIdentifier: "avatarSelectCollectionViewCell", for: indexPath) as! AvatarSelectCollectionViewCell
        newCell.avatarImageView.image = avatars[indexPath.item]
        return newCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currPlayer.image = avatars[indexPath.item]
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
