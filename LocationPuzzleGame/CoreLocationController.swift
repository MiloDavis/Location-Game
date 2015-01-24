//
//  CoreLocationController.swift
//  LocationPuzzleGame
//
//  Created by Charlie Peters on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation
import CoreLocation

class CoreLocationController : NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.distanceFilter  = 100
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
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
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        World.sharedInstance.nextPuzzle()
    }
}