//
//  PostAPI.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation
import Firebase


class PostAPI {
    
    var REF_POSTS = FIRDatabase.database().reference().child("posts")
    
    
    func observePosts(completion: @escaping (Post) -> Void) {
        REF_POSTS.observe(.childAdded) { (snapshot: FIRDataSnapshot) in
            if let postDictionary = snapshot.value as? [String: Any] {
                
                let newPost = Post.transformPost(postDictionary: postDictionary, key: snapshot.key)
                
                completion(newPost)
            }
        }
    }
    
    func observePost(withID id:String, completion: @escaping (Post) -> Void) {
        REF_POSTS.child(id).observeSingleEvent(of: .value, with: {
            snapshot in
            if let postDictionary = snapshot.value as? [String:Any] {
                let post = Post.transformPost(postDictionary: postDictionary, key: snapshot.key)
                completion(post)
            }
        })
    }
    
}

