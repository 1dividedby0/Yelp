//
//  BusinessMapViewController.swift
//  Yelp
//
//  Created by Dhruv Mangtani on 2/20/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import UIKit
import MapKit
class BusinessMapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var business:Business!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let location = CLLocationCoordinate2D(
            latitude: 37.774929,
            longitude: -122.419416
        )
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        println(business.latitude)
        mapView.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
