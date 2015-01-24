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

    var puzzles : [Puzzle] = [initPuzzle()]
    var currentPuzzleIndex: Int = 0
    var currentPuzzle: Puzzle? = nil
    var recievedMessages: [Message] = []
    var unreadMessages: Int = 0
    var messageSenders: [MessageSender] = [MessageSender(name:"Jefferson", imageName:"qm"), MessageSender(name:"Washington", imageName:"guyFawkes")]
    
    
    init() {
        
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
        return CLCircularRegion(center: self.currentPuzzle!.location, radius: 30.0, identifier: "location")
    }
    
}

func initPuzzle() -> Puzzle{
    var loc = CLLocationCoordinate2D(latitude: 80.0, longitude: 80.0)
    var mes:[Message] = [Message(body:TextMessage(text: "Test message is here."), id: "m1", calling: [""])]
    var hint:[Message] = [Message(body: TextMessage(text: "asdfasdfasdf"), id:"m1", calling:[String]())]
    var p : Puzzle = Puzzle(location: loc, messages: mes, hints: hint)
    return p
}

