//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Dhruv Mangtani on 2/21/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

class FiltersViewController: UITableViewController{
    
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    var foodTypes:Array<String> = ["Afghani", "African", "American (New)", "Arabian", "Argentine","Sandwiches","Steakhouses"]
    var categories:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    println("Sandwichesdsfsdfsdfsfsdfsdfsdfsdfsdfsdfdsfsdfsdfsdfdsfddsdffdsfdfd")
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTypes.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("restaurantsOptionsCell") as FilterTableViewCell
        cell.typeLabel.text = foodTypes[indexPath.row]
        cell.indicatorSwitch.on = false
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchAction(sender: AnyObject) {
        for(var section = 0; section < self.tableView.numberOfSections(); ++section){
            for(var row = 0; row < self.tableView.numberOfRowsInSection(section); ++row){
                var cellPath:NSIndexPath = NSIndexPath(forRow: row, inSection: section)
                var cell = self.tableView.cellForRowAtIndexPath(cellPath) as FilterTableViewCell
                if cell.indicatorSwitch.on{
                    if categories.isEmpty{
                        categories+=cell.typeLabel.text!
                    }else{
                        categories+=",\(cell.typeLabel.text!)"
                    }
                }
            }
            self.performSegueWithIdentifier("backFromFilterSegue", sender: searchButton)
        }
        println("Thingsuuuuuoioijljoiuioiuuiuiuiuiuiuuuiuiuiuiuiuuuiuiuiuuuuuuuuuuuu")
        println(categories)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backFromFilterSegue"{
            let main:ViewController = segue.destinationViewController as ViewController
            main.filterCategories = categories
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
}