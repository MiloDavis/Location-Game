//
//  Message.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import UIKit

// Creates a message
protocol MessageBody{
    func render()
}
// Message made up only of a String
class TextMessage:MessageBody{
    var text:String
    init(text:String){
        self.text = text
    }
    
    func render(){
        
    }
}
class ImageMessage:MessageBody{
    func render(){
        
    }
}
class SilentMessage:MessageBody{
    func render(){
        
    }
}


// Message defined based
class Message{
    var viewed = false
    var delivered = false
    var calling = [String]()// Messages the message will start
    var body: MessageBody
    //var timerStart
    init(body:MessageBody, calling:[String]){
        self.body = body
        self.calling = calling
        
    }
    func deliver(){
        
    }
    func atLocation(){
        
    }
    func start(){
        
    }
}


func messageTest(){
    var message = Message(body: TextMessage(text:"asdfasdfasdfasdf"), calling:[String]())
    message.deliver()
}

class Timeout{
    var callback: Void -> Void // Function called after delay
    var delay:Double // In seconds
    var canceled = false
    init(callback:Void -> Void, delay:Double){
        self.delay = delay
        self.callback = callback
        self.start()
    }
    func start(){
        //setting the delay time 60secs.
        let delay = self.delay * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            //call the method which have the steps after delay.
            if !self.canceled{
                self.callback()
            }
        }
    }
    func stop(){
        self.canceled = true
    }
    
}
