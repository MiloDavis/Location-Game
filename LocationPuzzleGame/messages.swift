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
    func atLocation() -> Bool{
        return false
    }
}

func messageTest(){
    var message = Message()
    message.deliver()
    var timeout = Timeout(callback:test, delay:5)
}


class Timeout{
    var callback: Void -> Void // Function called after delay
    var delay:Double // In seconds
    var canceled = false
    init(callback:Void -> Void, delay:Double){
        self.delay = delay
        self.callback = callback
        self.start()
    }
    func start(){
        //setting the delay time 60secs.
        let delay = self.delay * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            //call the method which have the steps after delay.
            if !self.canceled{
                self.callback()
            }
        }
    }
    func stop(){
        self.canceled = true
    }
    
}

func test(){
    println("asdfasdf")
}
