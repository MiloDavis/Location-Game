//
//  Hint.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation

class Hint {
    var images: [String]
    var text: String
    
    init(images: [String], text: String) {
        self.images = images
        self.text = text
    }
}