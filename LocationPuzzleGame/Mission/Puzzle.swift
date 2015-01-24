//
//  File.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation

class Puzzle {
    var items: [PuzzleItem]
    
    init(items: [PuzzleItem]) {
        self.items = items
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