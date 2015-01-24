//
//  Mission.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation

import Foundation

class Mission {
    var puzzles: [Puzzle]
    var puzzleIndex: Int
    var messages = [Message]()
    var unreadMessages: Int = 0
    
    init(puzzles: [Puzzle], puzzleIndex: Int) {
        self.puzzles = puzzles;
        self.puzzleIndex = puzzleIndex
    }
    
    func resume() -> Puzzle {
        return self.puzzles[puzzleIndex]
    }
    
    func sendMessage(message: Message) {
        self.messages.append(message)
        self.unreadMessages++
    }
}
