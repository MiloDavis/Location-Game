//
//  World.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation
import CoreLocation

class World {
    class var sharedInstance: World {
        struct Static {
            static var instance: World?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = World()
        }
        
        return Static.instance!
    }
    
    var puzzles: [Puzzle] = []
    var currentPuzzleIndex: Int = 0
    var currentPuzzle: Puzzle? = nil
    var recievedMessages: [Message] = []
    var unreadMessages: Int = 0
    
    init() {
        
    }
    
    func resume() -> Puzzle {
        return self.puzzles[self.currentPuzzleIndex]
    }
    
    func sendMessage(message: Message) {
        self.recievedMessages.append(message)
        self.unreadMessages++
    }
    
    func nextPuzzle() {
        self.currentPuzzle = self.puzzles[self.currentPuzzleIndex]
        self.currentPuzzleIndex++
    }
    
    func getAnswerRegion() -> CLRegion {
        return CLCircularRegion(center: self.currentPuzzle!.location, radius: 30.0, identifier: "location")
    }
    
}