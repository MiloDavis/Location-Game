//
//  SharedLocation.swift
//  LocationPuzzleGame
//
//  Created by Charlie Peters on 1/25/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class SharedLocation: NSObject, CLLocationManagerDelegate {
    class var sharedInstance: SharedLocation {
        struct Static {
            static var instance: SharedLocation?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = SharedLocation()
        }
        
        return Static.instance!
    }
    
    var locationManager = CLLocationManager()
    
    // You can access the lat and long by calling:
    // currentLocation2d.latitude, etc
    
    var currentLocation2d:CLLocationCoordinate2D?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.distanceFilter  = 100
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.startUpdatingLocation()
        self.locationManager.requestAlwaysAuthorization()
        
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        println("didChangeAuthorizationStatus")
        
        switch status {
        case .NotDetermined:
            println(".NotDetermined")
            break
            
        case .Authorized:
            println(".Authorized")
            self.locationManager.startMonitoringForRegion(World.sharedInstance.getAnswerRegion())
            break
            
        case .Denied:
            println(".Denied")
            break
            
        default:
            println("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.currentLocation2d = manager.location.coordinate
        
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        
        var alert = UIAlertView()
        alert.title = "New Secure Communication:"
        alert.message = "You have arrived"
        alert.addButtonWithTitle("Later")
        alert.addButtonWithTitle("View")
        alert.show()
    }
    
}

let sharedInstance = SharedLocation()