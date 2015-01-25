//
//  File.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation
import CoreLocation

class Puzzle {
    var location: CLLocationCoordinate2D
    var messages: [Message]
    var triggers: [Trigger]
    
    init(location: CLLocationCoordinate2D, messages:[Message], triggers: [Trigger]){
        self.location = location
        self.messages = messages
        self.triggers = triggers
        if(self.triggers.count != 0){
            self.triggers[0].start()
        }
    }
}