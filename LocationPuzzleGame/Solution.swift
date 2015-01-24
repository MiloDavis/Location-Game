//
//  Solution.swift
//  LocationPuzzleGame
//
//  Created by Charlie Peters on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation
import CoreLocation

class Solution {
    var location : CLRegion
    let answer : String
    
    init(location : CLRegion, answer : String) {
        self.location = location
        self.answer = answer
    }
    
}