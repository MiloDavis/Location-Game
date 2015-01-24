//
//  Message.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import UIKit

// Represents a Message to the user
protocol PMessage{
    func deliver()
    
}
// Message defined based
class Message: PMessage{
    var viewed = false
    var delivered = false
    //var timerStart
    init(){
        
        
    }
    func deliver(){
        //mission.unreadMessages += 1
        
    }
    func atLocation(){
        
    }
}

func messageTest(){
    var message = Message()
    message.deliver()
}