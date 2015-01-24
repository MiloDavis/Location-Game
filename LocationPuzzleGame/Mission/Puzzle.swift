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
    var hints: [Message]
    
    init(location: CLLocationCoordinate2D, messages:[Message], hints: [Message]) {
        self.location = location
        self.messages = messages
        self.hints = hints
    }
}