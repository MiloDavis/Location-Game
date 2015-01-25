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
    var currentPuzzleIndex: Int = 1
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
        return CLCircularRegion(center:CLLocationCoordinate2D(latitude: 42.336751, longitude: -71.0911301), radius:20, identifier:"location") //CLCircularRegion(center: self.currentPuzzle!.location, radius: 30.0, identifier: "location")
    }
    
}

func initPuzzle() -> Puzzle{
    var loc = CLLocationCoordinate2D(latitude: 42.336751, longitude: -71.0911301)
    var mes1:Message = Message(body:TextMessage(text: "Test message is here."), id: "m1")
    mes1.delivered = true;
    var mes2:Message = Message(body: TextMessage(text: "asdfasdfa sdf asdfa dsa as dfas;dlkfjas;ldk jfa;sldkjfas;ldkfja;slkdj fa;sldkj;aslkdj ;adslk jda;lk jds;lkaj l;ksjd ;alksjdf ;laksjd f;laksjd f;laksjdf ;lakjsd;fl kjas;dlk jas;l dkjal;sdkjf a;lsdkjf;alskdjf;alskjdf"), id:"m2")
    mes2.delivered = true
    var mArray:[Message] = [mes1, mes2]
    var p : Puzzle = Puzzle(location: loc, messages: mArray, triggers: [Trigger]())
    return p
}

