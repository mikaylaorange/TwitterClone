//
//  Tweet.swift
//  Twitter
//
//  Created by Mikayla Orange on 2/27/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import Foundation
class Tweet {

    var tweet: String
    var displayName: String
    var atName: String
    var profilePicture: URL?

    
    init(dict: NSDictionary) {
        tweet = dict["text"] as! String
        displayName = dict.value( forKeyPath: "user.name" ) as! String
        atName = dict.value( forKeyPath: "user.screen_name" ) as! String
        profilePicture = URL(string: dict.value( forKeyPath: "user.profile_image_url_https" )as! String) 
        
    }
}
