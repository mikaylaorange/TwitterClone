//
//  TweetCell.swift
//  Twitter
//
//  Created by Mikayla Orange on 2/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var atName: UILabel!
    @IBOutlet weak var tweet: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetId:Int = -1
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePicture.layer.masksToBounds = true
    	profilePicture.layer.cornerRadius = profilePicture.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        let url = "https://api.twitter.com/1.1/favorites/create.json"
        let unfavoriteUrl = "https://api.twitter.com/1.1/favorites/destroy.json"
        let params = ["id": tweetId]
        if (toBeFavorited) {
            TwitterAPICaller.client?.post(url, parameters: params, progress: nil, success: {
                                            (task: URLSessionDataTask?, response: Any?) in
                                            self.setFavorited(true)},
                                          failure: { (task: URLSessionDataTask?, Error) in
                print("oh no!")
            })
        }
        else {
            TwitterAPICaller.client?.post(unfavoriteUrl, parameters: params, progress: nil, success: {
                                            (task: URLSessionDataTask?, response: Any?) in
                                            self.setFavorited(false)},
                                          failure: { (task: URLSessionDataTask?, Error) in
                print("oh no!")
            })
        }
        
        
    }
    @IBAction func retweetTweet(_ sender: Any) {
        let params = ["id": tweetId]
        let url = "https://api.twitter.com/1.1/statuses/retweet/\(tweetId).json"
        let undoUrl = "https://api.twitter.com/1.1/statuses/unretweet/\(tweetId).json"
        let toBeRetweeted = !retweeted
        if (toBeRetweeted) {
            TwitterAPICaller.client?.post(url, parameters: params, progress: nil, success: {
                                            (task: URLSessionDataTask?, response: Any?) in
                                            self.setRetweet(true)},
                                          failure: { (task: URLSessionDataTask?, Error) in
                print("oh no!")
        })
    }
        else {
            TwitterAPICaller.client?.post(undoUrl, parameters: params, progress: nil, success: {
                                            (task: URLSessionDataTask?, response: Any?) in
                                            self.setRetweet(false)},
                                          failure: { (task: URLSessionDataTask?, Error) in
                print("oh no! \(Error)")
        })
        }
    }
    func setFavorited(_ isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favoriteButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    func setRetweet(_ isRetweeted: Bool) {
        retweeted = isRetweeted
        if (retweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        }
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }

}
