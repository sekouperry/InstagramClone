//
//  CommentAPI.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation
import Firebase


class CommentAPI {
    
    var REF_COMMENTS = FIRDatabase.database().reference().child("comments")
    
    
    func observeComments(withPostID id: String, completion: @escaping (Comment) -> Void) {
        REF_COMMENTS.child(id).observeSingleEvent(of: .value, with: { snapshot in
            if let commentDictionary = snapshot.value as? [String: Any] {
                
                let newComment = Comment.transformComment(postDictionary: commentDictionary)
                
                completion(newComment)
            }
        })
    }
    
}
