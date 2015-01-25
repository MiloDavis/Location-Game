//
//  MessagesViewController.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import UIKit
import CoreLocation

class MessagesViewController: UIViewController {
    
    var loc = CoreLocationController()
    
    @IBOutlet var messagesScrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        renderMessages([TextMessage(text:"asdfasdfasdfasdfasdf"), ImageMessage(imageName:"field"),ImageMessage(imageName:"field"),ImageMessage(imageName:"field"), TextMessage(text:"asdfasdfasdfasdfasdf"), ImageMessage(imageName:"field"),ImageMessage(imageName:"field"),ImageMessage(imageName:"field")])

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
    }
    func renderMessages(messages:[MessageBody]){
        var yStart:CGFloat = 10
        for message in messages{
            if(message.type == "Text"){
                yStart += renderText(message as TextMessage, start: yStart)
            }
            else if(message.type == "Image"){
                yStart += renderImage(message as ImageMessage, start: yStart)
            }
            messagesScrollview.contentSize = CGSize(width:UIScreen.mainScreen().bounds.width, height: yStart)
        }
    }
    
    // Renders a TextMessage
    func renderText(message:TextMessage, start:CGFloat) -> CGFloat{
        var xSideBuffer:CGFloat = 10
        var textView = UITextView()
        var rectWidth:CGFloat = UIScreen.mainScreen().bounds.width - xSideBuffer*2
        textView.text = message.text
        // Preferences
        textView.hidden = false
        textView.editable = false
        textView.selectable = false
        textView.scrollEnabled = false
        textView.frame = CGRect(origin:CGPoint(x:xSideBuffer, y:start), size:CGSize(width:rectWidth, height:30))
        messagesScrollview.addSubview(textView)
        return textView.frame.height
    }
    
    func renderImage(message:ImageMessage, start:CGFloat) -> CGFloat{
        var imageObj = UIImage(named: message.path)
        var xSideBuffer:CGFloat = 10
        var rectWidth:CGFloat = UIScreen.mainScreen().bounds.width - xSideBuffer*2
        var height:CGFloat = imageObj!.size.height*rectWidth/imageObj!.size.width
        var imageView = UIImageView(image:imageObj)
        imageView.frame = CGRect(origin:CGPoint(x:xSideBuffer, y:start), size:CGSize(width:rectWidth, height:height))
        messagesScrollview.addSubview(imageView)
        return height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
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

}
