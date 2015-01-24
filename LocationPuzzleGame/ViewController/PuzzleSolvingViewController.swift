//
//  PuzzleSolvingViewController.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import UIKit

class PuzzleSolvingViewController: UIViewController {
    
    var world = World.sharedInstance
    
    @IBOutlet var hintTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hints = world.hints
        for hint in hints {
            self.hintTextView.text! += "\n \(hint.text)"
        }
    }
}
