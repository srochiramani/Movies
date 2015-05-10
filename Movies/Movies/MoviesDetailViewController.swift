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
    
    var movie : NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitleLabel.text = movie["title"] as! String
        movieSynopsisLabel.text = movie["synopsis"] as! String
        
        let posterThumbUrl = movie.valueForKeyPath("posters.thumbnail") as! String
        let posterHighResUrl = getPosterHighResUrl(posterThumbUrl)
        bgImageView.setImageWithURL(NSURL(string: posterHighResUrl))

        // Do any additional setup after loading the view.
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
