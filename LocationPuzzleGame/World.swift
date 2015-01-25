import Foundation
import CoreLocation

class World {
    class var sharedInstance: World {
        struct Static {
            static var instance: World?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = World()
        }
        
        return Static.instance!
    }

    var puzzles : [Puzzle] = initPuzzle()
    var currentPuzzleIndex: Int = 1
    var currentPuzzle: Puzzle
    var recievedMessages: [Message] = []
    var unreadMessages: Int = 0
    var messageSenders: [MessageSender] = [MessageSender(name:"Jefferson", imageName:"qm"), MessageSender(name:"Washington", imageName:"guyFawkes")]
    
    init() {
        self.currentPuzzle = puzzles[0]
    }
    
    func resume() -> Puzzle {
        return self.puzzles[self.currentPuzzleIndex]
    }
    
    func sendMessage(message: Message) {
        self.recievedMessages.append(message)
        self.unreadMessages++
    }
    
    func nextPuzzle() {
        self.currentPuzzle = self.puzzles[self.currentPuzzleIndex]
        self.currentPuzzleIndex++
    }
    
    func getAnswerRegion() -> CLRegion {
       return CLCircularRegion(center: self.currentPuzzle.location, radius: 30, identifier: "location")
    }
    
}

func initPuzzle() -> [Puzzle] {
    let c = Content()
    var puzzles = [c.p0, c.p1, c.p2, c.p3, c.p4, c.p5, c.p6]
    return puzzles
}

