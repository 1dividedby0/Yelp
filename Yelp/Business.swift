    //
//  Business.swift
//  Yelp
//
//  Created by Dhruv Mangtani on 2/19/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
class Business{
var info:NSDictionary
    
init(info: NSDictionary){
    self.info = info
}
    
    var name:String{
        get{
            println("NAMEBEINGCALLED")
            println(info["name"])
            return info["name"] as String
        }
    }
    var reviews:Int{
        get{
            return info["review_count"] as Int
        }
    }
    var address:String{
        get{
            if let location = info["location"] as? NSDictionary{
                if let displayAddress = location["display_address"] as? Array<String>{
                    return ", ".join(displayAddress)
                }
            }
            return ""
        }
    }
    var categories:String{
        get{
            if let categories = info["categories"] as? Array<Array<String>>{
                return ", ".join(categories.map({ return $0[0] }))
            }
            return ""
        }
    }
    var ratingsImageURL:NSURL{
        get{
            return NSURL(string: info["rating_img_url"] as String)!
        }
    }
    var smallImageURL:NSURL?{
        get{
            println("namedsafsdf")
            println(info["image_url"])
            if let image = info["image_url"] as? String{
            return NSURL(string: info["image_url"] as String)
            }
            return NSURL(string: "https://browshot.com/static/images/not-found.png")
        }
    }
    var phone:String{
        get{
            return info["phone"] as String
        }
    }
    var latitude:Double{
        get{
            if let location = info["location"] as? NSDictionary{
                if let coordinate = location["coordinate"] as? NSDictionary{
                    return coordinate["latitude"] as Double
                }
            }
            return 0.0
        }
    }
    var longitude:Double{
        get{
            if let location = info["location"] as? NSDictionary{
                if let coordinate = location["coordinate"] as? NSDictionary{
                    return coordinate["longitude"] as Double
                }
            }
            return 0.0
        }
    }
}