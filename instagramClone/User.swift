//
//  User.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation
class User {
    var email: String?
    var profileImageURL: String?
    var username: String?
}

extension User {
    
    static func transformUser(postDictionary: [String: Any]) -> User {
        let user = User()
        
        user.email = postDictionary["email"] as? String
        user.profileImageURL = postDictionary["profileImageURL"] as? String
        user.username = postDictionary["username"] as? String
        
        return user
    }
    
}

