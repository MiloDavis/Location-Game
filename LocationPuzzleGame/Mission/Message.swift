import UIKit

// Creates a message
protocol MessageBody{
    var type:String{ get set }
    // This is to allow me to alert text events
    var text:String{ get set }
}
// Message made up only of a String
class TextMessage:MessageBody {
    var text: String
    var type = "Text"
    init(text: String) {
        self.text = text
    }
}
class ImageMessage:MessageBody {
    var path: String
    var type = "Image"
    var text = "[Image]"
    init(imageName:String){
        self.path =  imageName
    }
}
class SilentMessage:MessageBody{
    var type = "Silent"
    var text = "[Silent]"
}

class MessageSender{
    var name: String
    let imageName: String
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

// Message defined based
class Message {
    var viewed = false
    var delivered = false
    var calling = [String]()// Messages the message will start
    var body: MessageBody
    var id:String
    //var from: String
    //var timerStart
    init(body:MessageBody, id:String, calling:[String]/*, from:String*/){
        self.body = body
        self.id = id
        self.calling = calling
        //self.from = from
        
    }
    func deliver(){
        self.alert()
        var w = World.sharedInstance
        w.unreadMessages += 1
        var messages = w.puzzles[w.currentPuzzleIndex].messages
        for call in calling {
            for m in messages {
                m.start()
            }
        }
    }
    
    func alert(){
        if(self.body.type == "Silent"){
            
        }
        else if(self.body.type == "Text"){
            var alert = UIAlertView()
            alert.title = "New Secure Communication:"
            alert.message = self.body.text
            alert.addButtonWithTitle("Later")
            alert.addButtonWithTitle("View")
            alert.show()
            
        }
        
    }
    
    func atLocation(){
        
    }
    func start(){
        
    }
}

func messageTest(){
    var trig = TimeTrigger(messageID:"m1", delay:5)
}
protocol Trigger {
    
}
class TimeTrigger: Trigger {
    var delay:Double
    var timeout: Timeout? = nil
    var messageID: String
    init(messageID: String, delay: Double){
        self.messageID = messageID
        self.delay = delay
        self.timeout = Timeout(callback: self.trigger, delay: delay)
        
        // Local notification of event
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = "You have recieved a new secure communication!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: delay)
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.category = "invite"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    func trigger() -> Void{
        var w = World.sharedInstance
        var messages = w.puzzles[w.currentPuzzleIndex].messages
        for m in messages{
            if(m.id == messageID){
                m.deliver()
            }
        }
    }
}

// Calls the given callback after the given delay (in seconds)
class Timeout{
    var callback: Void -> Void // Function called after delay
    var delay:Double // In seconds
    var canceled = false
    init(callback:Void -> Void, delay:Double) {
        self.delay = delay
        self.callback = callback
        self.start()
    }
    func start(){
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
