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
    var items: [PuzzleItem]
    var location: CLLocationCoordinate2D
    
    init(items: [PuzzleItem], location: CLLocationCoordinate2D) {
        self.items = items
        self.location = location
    }
}

protocol PuzzleItem {
    
}

class TextPuzzleItem: PuzzleItem {
    var item: String
    
    init(item: String) {
        self.item = item
    }
}

class ImagePuzzleItem: PuzzleItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}