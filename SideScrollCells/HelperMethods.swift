//
//  HelperMethods.swift
//  SideScrollCells
//
//  Created by Daniel Oram on 11/11/16.
//  Copyright © 2016 Daniel Oram. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRow = 15
    
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}


extension UIColor {
    
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}


//functions for calling flickr api

func getImagesFromAPI() {
    Alamofire.request("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=ca4a2557448ed06d8f8548b96187ece4&format=json&nojsoncallback=1&auth_token=72157676448888075-c0f321170a03c27c&api_sig=16c5415ddae6b8109b90d22de89b66f3").responseJSON { response in
        
            //parse response json into images
        
    }
}

//static var for getting images

class Assets {
    
    static var tempImages: [UIImage]!
    
    static var Images: [UIImage] {
        get {
            Alamofire.request("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=ca4a2557448ed06d8f8548b96187ece4&format=json&nojsoncallback=1&auth_token=72157676448888075-c0f321170a03c27c&api_sig=16c5415ddae6b8109b90d22de89b66f3").responseJSON { response in
                
                //convert json data to images
                tempImages = [UIImage]()
            }
            return tempImages
        }
        set {
            
        }
    }
}


class PhotoMngr {
    static let sharedInstance = PhotoMngr()
    
    var photos: [UIImage] = [UIImage]()
    
    private init() {}
    
}


