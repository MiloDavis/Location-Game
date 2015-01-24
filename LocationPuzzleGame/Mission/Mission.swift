import Foundation

class Mission {
    var puzzles: [Puzzle]
    var puzzleIndex: Int
    
    init(puzzles: [Puzzle], puzzleIndex: Int) {
        self.puzzles = puzzles;
        self.puzzleIndex = puzzleIndex
    }
    
    func resume() -> Puzzle {
        return self.puzzles[puzzleIndex]
    }
}
