//
//  UserPostAPI.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation
import Firebase


class UserPostAPI {
    
    var REF_USER_POSTS = FIRDatabase.database().reference().child("user-posts")
    
}

