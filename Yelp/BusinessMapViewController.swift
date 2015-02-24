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
    
    
    //@IBOutlet weak var mapView: MKMapView!
    var results:[Business]!
    //var annotations:[MKPointAnnotation]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        println("\(results)IOJSDOFJNLS:DF:LONSFNOSDJLNFLJSDNFKJNSDFKLJNSKJDLFNKLJSDNFJNSDJfijjejrejerjkgkndkaerg;kerkjerkjkjr;erkj")
        let location = CLLocationCoordinate2D(
            latitude: 37.774929,
            longitude: -122.419416
        )
        let span = MKCoordinateSpanMake(0.15, 0.15)
        let region = MKCoordinateRegion(center: location, span: span)
        //mapView.setRegion(region, animated: true)
        for business in results{
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = business.name
        annotation.subtitle = business.address
        println("ifkdshnlksfjndjkmfn\(annotation)")
        //mapView.addAnnotation(annotation)
        }
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
