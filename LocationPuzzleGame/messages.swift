import UIKit

// Represents a Message to the user
protocol PMessage{
    func deliver()
    
}
// Message defined based
class Message: PMessage{
    var viewed = false
    var delivered = false
    //var timerStart
    init(){
        
        
    }
    func deliver(){
        //mission.unreadMessages += 1
        
    }
    func atLocation(){
        
    }
}

func messageTest(){
    var message = Message()
    message.deliver()
}