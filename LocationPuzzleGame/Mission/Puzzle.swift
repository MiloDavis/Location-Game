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
    var url: NSURL
    
    init(imageName: String) {
        self.url = NSURL(string: "http://ccs.neu.edu/home/jcf0810/" + imageName)!
    }
}