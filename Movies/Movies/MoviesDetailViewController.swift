//
//  MoviesDetailViewController.swift
//  Movies
//
//  Created by Sunny Rochiramani on 5/10/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class MoviesDetailViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieSynopsisLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var userReviewScoreIcon: UIImageView!
    @IBOutlet weak var userReviewScoreLabel: UILabel!
    
    var movie : NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieTitle = movie["title"] as! String
        let synopsis = movie["synopsis"] as! String
        
        self.title = movieTitle
        movieTitleLabel.text = movieTitle
        movieSynopsisLabel.text = synopsis
        
        let posterThumbUrl = movie.valueForKeyPath("posters.thumbnail") as! String
        let posterHighResUrl = getPosterHighResUrl(posterThumbUrl)
        bgImageView.setImageWithURL(NSURL(string: posterHighResUrl))
        
        // user review score
        userReviewScoreIcon.setImageWithURL(NSURL(string: "http://d3biamo577v4eu.cloudfront.net/static/images/icons/popcorn_27x31.png"))
        let audienceScore = movie.valueForKeyPath("ratings.audience_score")!
        userReviewScoreLabel.text = audienceScore.stringValue + "%"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPosterHighResUrl(url : String) -> String {
        let lastIndex = url.rangeOfString("cloudfront.net")?.endIndex
        return "https://content6.flixster.com" + url.substringFromIndex(lastIndex!)
    }
    

}
