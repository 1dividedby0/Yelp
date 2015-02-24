//
//  ViewController.swift
//  Yelp
//
//  Created by Dhruv Mangtani on 2/18/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate  {
    
    @IBOutlet weak var mapButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var searchBar = UISearchBar()
    var client: YelpClient!
    var filterCategories:String = ""
    var results: [Business] = []
    //var businesses:[Business]
    var yelpConsumerKey = "SsW3_QOnrtbykV-0ZjyUjg"
    var yelpConsumerSecret = "JKJBxIhDqTGqWcJXdoODm7Nmo4s"
    var yelpToken = "23AxjoQet_4hNryEpTYb56rpVW5OVGlU"
    var yelpTokenSecret = "pqefbHV0T4BtZem1OIXwZMa-euc"
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("Size")
        return results.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as BusinessTableViewCell
        var business = self.results[indexPath.row]
        println("\(business.name) SELECTED")
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let business = self.results[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as BusinessTableViewCell
        cell.nameLabel.text = "\(indexPath.row + 1). \(business.name)"
        cell.ratingImageView.setImageWithURL(business.ratingsImageURL)
        cell.thumbImageView.setImageWithURL(business.smallImageURL?)
        cell.ratingLabel.text = "\(business.reviews) Reviews"
        cell.addressLabel.text = business.address
        cell.categoryLabel.text = business.categories
        return cell
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        println("SEarchTextChange")
        client.searchWithTerm(searchText, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response["businesses"])
            let results = (response["businesses"] as Array).map({
                (business: NSDictionary) -> Business in
                return Business(info: business)
            })
            println(self.tableView)
            self.results = results
            println("About to reload")
            self.tableView.reloadData()
            println("DSFSDFSDFSDFS")
            for i in results {
                //println(i.smallImageURL)
            }
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        })

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBarHidden=false;
        self.tableView.registerNib(UINib(nibName: "BusinessTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "BusinessCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        //self.tableView.estimatedRowHeight = 116
        self.tableView.reloadData()
        println("dsfldlfnskldnflkdnflkns\(filterCategories)")
        self.navigationItem.titleView = searchBar
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm(self.filterCategories, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            //println(response["businesses"])
            let results = (response["businesses"] as Array).map({
                (business: NSDictionary) -> Business in
                return Business(info: business)
            })
            println(self.tableView)
            self.results = results
            self.tableView.reloadData()
            println("DSFSDFSDFSDFS")
            for i in results {
                //println(i.smallImageURL)
            }
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func mapAction(sender: AnyObject) {
        self.performSegueWithIdentifier("toMap", sender: mapButton)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toMap"{
            var main:BusinessMapViewController = segue.destinationViewController as BusinessMapViewController
            main.results = self.results
    }
}
}
