// Playground - noun: a place where people can play

import Cocoa

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

var text1 = TextPuzzleItem(item: "This is a puzzle item.")
var image1 = ImagePuzzleItem(imageName: "jack.jpg")

var puzzle1 = Puzzle(items: [text1, image1])

var image = NSImage(contentsOfURL: (puzzle1.items[1] as ImagePuzzleItem).url)