//
//  PostCommentAPI.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation
import Firebase


class PostCommentAPI {
    
    var REF_POST_COMMENTS = FIRDatabase.database().reference().child("post-comments")
    
    
    func observePostComments(withPostID id: String, completion: @escaping (String) -> Void) {
        let postCommentRef = REF_POST_COMMENTS.child(id)
        completion(postCommentRef.key)
    }
    
}
