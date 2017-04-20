//
//  Comment.swift
//  instagramClone
//
//  Created by Kenneth Okereke on 4/20/17.
//  Copyright © 2017 Kenneth Okereke. All rights reserved.
//

import Foundation

class Comment {
    var commentText: String?
    var uid: String?
}

extension Comment {
    
    static func transformComment(postDictionary: [String: Any]) -> Comment  {
        let comment = Comment()
        
        comment.commentText = postDictionary["commentText"] as? String
        comment.uid = postDictionary["uid"] as? String
        
        return comment
    }
    
}
