//
//  Post.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase


class Post {
    var caption: String?
    var photoURL: String?
    var uid: String?
    var id: String?
    var likeCount: Int?
    var likes: Dictionary<String, Any>?
    var isLiked: Bool?
}

extension Post {
    
    static func transformPost(postDictionary: [String: Any], key: String) -> Post {
        let post = Post()
        
        post.id = key
        post.caption = postDictionary["caption"] as? String
        post.photoURL = postDictionary["photoURL"] as? String
        post.uid = postDictionary["uid"] as? String
        post.likeCount = postDictionary["likesCount"] as? Int
        post.likes = postDictionary["likes"] as? Dictionary<String, Any>
        
        if let currentUserID = FIRAuth.auth()?.currentUser?.uid {
            if post.likes != nil {
                post.isLiked = post.likes![currentUserID] != nil
            }
        }
        
        return post
    }
    
}
