//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by Sunny Rochiramani on 5/5/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let instructorKey = "dagqdghwaq3e3mxyrp7kmmj5"
    
    var movies : [NSDictionary]?

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        fetchLatestMovies()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movies != nil {
            return movies!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieTableCell", forIndexPath: indexPath) as! MovieTableViewCell
        
        let movie = self.movies![indexPath.row]
        cell.titleLabel?.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        
        let posterUrl = NSURL(string: movie.valueForKeyPath("posters.thumbnail") as! String)!
        cell.posterImageView.setImageWithURL(posterUrl)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cell = sender as! MovieTableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        
        let movie = self.movies![indexPath.row]
        let movieDetailsViewController = segue.destinationViewController as! MoviesDetailViewController
        movieDetailsViewController.movie = movie

    }
    
    func fetchLatestMovies() {
        self.loadingIndicator.startAnimating()
        let url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=" + instructorKey)!
        let request = NSURLRequest(URL: url)
        let queue = NSOperationQueue.mainQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            println(" data: \(data) response: \(response) + error: \(error)")
            if (data != nil) {
                var jsonResult: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary
                println("AsSynchronous\(jsonResult)")
                if (jsonResult != nil) {
                    self.movies = jsonResult!["movies"] as! [NSDictionary]?
                    println("movies size: \(self.movies!.count)")
                    self.tableView.reloadData()
                }
            }
            self.loadingIndicator.stopAnimating()
        })
    }

}
