import Foundation
import CoreLocation
import UIKit

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
        
        var alert = UIAlertView()
        alert.title = "New Secure Communication:"
        alert.message = "You have arrived"
        alert.addButtonWithTitle("Later")
        alert.addButtonWithTitle("View")
        alert.show()
        
        //World.sharedInstance.nextPuzzle()
    }
}