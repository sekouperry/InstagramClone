//
//  UserAPI.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth


class UserAPI {
    
    var REF_USERS = FIRDatabase.database().reference().child("users")
    
    var CURRENT_USER: FIRUser? {
        if let currentUser = FIRAuth.auth()?.currentUser {
            return currentUser
        }
        return nil
    }
    
    var CURRENT_USER_ID = FIRAuth.auth()?.currentUser?.uid
    
    var REF_CURRENT_USER: FIRDatabaseReference? {
        guard let currentUser = FIRAuth.auth()?.currentUser else {
            return nil
        }
        return REF_USERS.child(currentUser.uid)
    }
    
    func observeCurrentUser(completion: @escaping (User) -> Void) {
        guard let currentUser = FIRAuth.auth()?.currentUser else {
            return
        }
        
        REF_USERS.child(currentUser.uid).observeSingleEvent(of: .value, with: { snapshot in
            if let postDictionary = snapshot.value as? [String: Any] {
                let user = User.transformUser(postDictionary: postDictionary)
                completion(user)
            }
        })
    }
    
    func observeUser(withID uid:String, completion: @escaping (User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value, with: { snapshot in
            if let postDictionary = snapshot.value as? [String: Any] {
                let user = User.transformUser(postDictionary: postDictionary)
                completion(user)
            }
        })
    }
    
}

