//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Dhruv Mangtani on 2/21/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

class FiltersViewController: UITableViewController, FilterViewCellDelegate{
    
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    var foodTypes:Array<String> = ["Afghani", "African", "American (New)", "Arabian", "Argentine","Sandwiches","Steakhouses"]
    var sortTypes:Array<String> = ["Best Match", "Distance", "Highest Rated"]
    var deals:String = "Deals"
    var distances:Array<Int> = [1000, 5000, 10000]
    var categories:String = ""
    var typeNotifier:Int = 0
    
    var categoryFiltersDictionary: [Int: Bool] = [Int:Bool]()
    var sortTypesFiltersDictionary: [Int: Bool] = [Int:Bool]()
    var dealsFiltersDictionary: [Int: Bool] = [Int:Bool]()
    var distancesFiltersDictionary: [Int: Bool] = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    println("Sandwichesdsfsdfsdfsfsdfsdfsdfsdfsdfsdfdsfsdfsdfsdfdsfddsdffdsfdfd")
    typeNotifier = 0
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Sort"
        }
        else if section == 1{
            return "Most Popular"
        }
        else if section == 2{
            return "Distances"
        }
        else if section == 3{
        return "Categories"
        }
        return ""
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return sortTypes.count
        }
        else if section == 1{
            return 1
        }
        else if section == 2{
            return distances.count
        }
        else if section == 3{
        return foodTypes.count
        }
        return 0
    }
    func filterView(filterCell: FilterTableViewCell, didChangeSwitchValue value: Bool) {
        println("Hello")
        let indexPath = self.tableView.indexPathForCell(filterCell)!
        switch indexPath.section{
        case 0:
            println("Sort")
            println(indexPath)
            sortTypesFiltersDictionary[indexPath.row] = value
            println(sortTypesFiltersDictionary)
        case 1:
            println("Details")
            println(indexPath.row)
            dealsFiltersDictionary[indexPath.row] = value
        case 2:
            println("Distance")
            println(indexPath.row)
            distancesFiltersDictionary[indexPath.row] = value
        case 3:
            println("Category")
            println(indexPath.row)
            categoryFiltersDictionary[indexPath.row] = value
        default:
            break
        }
    }
    func setCellSwitch(filterType type:FilterTypes, forCell cell:FilterTableViewCell, forIndexPath indexPath:NSIndexPath){
        switch type{
        case .Category:
            println(categoryFiltersDictionary)
        if let value = categoryFiltersDictionary[indexPath.row]{
            cell.indicatorSwitch.on = value
        }else{
            cell.indicatorSwitch.on = false
        }
        case .Sort:
            if let value = sortTypesFiltersDictionary[indexPath.row]{
                cell.indicatorSwitch.on = value
            }else{
                cell.indicatorSwitch.on = false
            }
        case .Deals:
            if let value = dealsFiltersDictionary[0]{
                cell.indicatorSwitch.on = value
            }else{
                cell.indicatorSwitch.on = false
            }
        case .Distance:
            if let value = distancesFiltersDictionary[indexPath.row]{
                cell.indicatorSwitch.on = value
            }else{
                cell.indicatorSwitch.on = false
            }

        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("restaurantsOptionsCell") as FilterTableViewCell
        cell.delegate = self
        if typeNotifier < 3 {
            cell.typeLabel.text = sortTypes[indexPath.row]
            self.setCellSwitch(filterType: FilterTypes.Sort, forCell: cell, forIndexPath: indexPath)
        }
        else if typeNotifier > 2 && typeNotifier < 4{
            cell.typeLabel.text = deals
            self.setCellSwitch(filterType: FilterTypes.Deals, forCell: cell, forIndexPath: indexPath)
        }
        else if typeNotifier > 3 && typeNotifier < 7{
            cell.typeLabel.text = "\(distances[indexPath.row])"
            self.setCellSwitch(filterType: FilterTypes.Distance, forCell: cell, forIndexPath: indexPath)
        }
        else{
            cell.typeLabel.text = foodTypes[indexPath.row]
            self.setCellSwitch(filterType: FilterTypes.Category, forCell: cell, forIndexPath: indexPath)
        }
        cell.indicatorSwitch.on = false
        typeNotifier++
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
                println(cellPath)
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
    enum FilterTypes{
        case Category, Sort, Deals, Distance
    }
}