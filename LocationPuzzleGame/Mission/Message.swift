import UIKit

// Creates a message
protocol MessageBody{
    var type:String{ get set }
}
// Message made up only of a String
class TextMessage:MessageBody{
    var text:String
    var type = "Text"
    init(text:String){
        self.text = text
    }
}
class ImageMessage:MessageBody{
    var path:String
    var type = "Image"
    init(imageName:String){
        self.path =  imageName
        //"/Users/alicedavis/Documents/IOS Dev/Location-Game/LocationPuzzleGame/Mission/imageMessages/"
    }
}
class SilentMessage:MessageBody{
    var type = "Silent"
}

// Message defined based
class Message{
    var viewed = false
    var delivered = false
    var calling = [String]()// Messages the message will start
    var body: MessageBody
    //var timerStart
    init(body:MessageBody, calling:[String]){
        self.body = body
        self.calling = calling
        
    }
    func deliver(){
        
    }
    func atLocation(){
        
    }
    func start(){
        
    }
}


func messageTest(){
    var message = Message(body: TextMessage(text:"asdfasdfasdfasdf"), calling:[String]())
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
