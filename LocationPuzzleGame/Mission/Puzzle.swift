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
    var hints: [Hint]
    
    init(location: CLLocationCoordinate2D, hints: [Hint]) {
        self.location = location
        self.hints = hints
    }
}

class Hint {
    var images: [String?]
    var text: String
    
    init(images: [String?], text: String) {
        self.images = images
        self.text = text
    }
}