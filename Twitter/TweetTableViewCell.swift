//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Tiffany Lee on 11/3/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    

    var favorited:Bool = false
    var tweedId:Int = -1
    var retweet:Bool = false
    
    func setFavorited( isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    func setRetweeted( isRetweed: Bool) {
        retweet = isRetweed
        if (isRetweed) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for:
                    UIControl.State.normal)
        } else {
        retweetButton.setImage(UIImage(named: "retweet-icon"), for:
                    UIControl.State.normal)
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    //time label here
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!

    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorite = !favorited
        if (toBeFavorite) {
            TwitterAPICaller.client?.favoriteTweet(tweedId: tweedId, success: {
                self.setFavorited(isFavorited: true)
            }, failure: { (error) in
                print ("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweedId: tweedId, success: {
                self.setFavorited(isFavorited: false)
            }, failure: { (error) in
                print ("Unfavorite did not succeed: \(error)")
        })
    }
    }
    @IBAction func retweet(_ sender: Any) {
        let toBeRetweeted = !retweet
        if (toBeRetweeted) {
            TwitterAPICaller.client?.retweet(tweedId: tweedId, success: {
                self.retweet(true)
            }, failure: { (error) in
                print ("Error is retweeting : \(error)")
            })
        
        } else {
            TwitterAPICaller.client?.unretweet(tweedId: tweedId, success: {
                self.retweet(false)
            }, failure: { (error) in
                print ("Error is retweeting : \(error)")
            })
        }
    
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
