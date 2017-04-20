//
//  ProfileHeaderCollectionReusableView.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    var user: User? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        self.nameLabel.text = user?.username
        
        if let photoURL = user?.profileImageURL {
            self.profileImageView.sd_setImage(with: URL(string: photoURL))
        }
    }

        
}
