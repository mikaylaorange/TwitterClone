//
//  CreateTweetViewController.swift
//  Twitter
//
//  Created by Mikayla Orange on 2/28/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class CreateTweetViewController: UIViewController {

    @IBOutlet weak var createdTweet: UITextView!
    @IBOutlet weak var profilePicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createdTweet.becomeFirstResponder()
       self.createdTweet.layer.borderColor = UIColor.lightGray.cgColor
        self.createdTweet.layer.borderWidth = 1
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendTweet(_ sender: Any) {
       
        if (!createdTweet.text.isEmpty) {
            let tweetUrl = "https://api.twitter.com/1.1/statuses/update.json"
             let myParams = ["status": createdTweet.text]
            TwitterAPICaller.client?.post(tweetUrl, parameters: myParams as [String: Any], progress: nil,  success: {_,_ in
                print("success!")
                self.dismiss(animated: true, completion: nil)
            }, failure: { (nil, Error) in
                print("oh no")
                self.dismiss(animated: true, completion: nil)

            })
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
