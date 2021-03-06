//
//  MessagesViewController.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import UIKit
import CoreLocation

class MessagesViewController: UIViewController {
    
    var loc = SharedLocation.sharedInstance
    
    @IBOutlet var messagesScrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderMessages()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
    }
    func rerender() {
        renderMessages()
    }
    
    func renderMessages(){
        var w = World.sharedInstance
        var messages = [Message]()
        for (var i=0; i<w.currentPuzzleIndex; i++){
            messages += w.puzzles[i].messages
        }
        
        
        var yStart:CGFloat = 30
        for message in messages{
            if(!message.delivered){
                continue;
            }
            if(message.body.type == "Text"){
                yStart += renderText(message.body as TextMessage, start: yStart)
            }
            else if(message.body.type == "Image"){
                yStart += renderImage(message.body as ImageMessage, start: yStart)
            }
            messagesScrollview.contentSize = CGSize(width:UIScreen.mainScreen().bounds.width, height: yStart)
        }
        
        self.messagesScrollview.setNeedsDisplay()
    }
    
    // Renders a TextMessage
    func renderText(message:TextMessage, start:CGFloat) -> CGFloat{
        var xSideBuffer:CGFloat = 10
        var textView = UITextView()
        var rectWidth:CGFloat = UIScreen.mainScreen().bounds.width - xSideBuffer*2
        textView.text = message.text
        // Preferences
        textView.hidden = false
        textView.editable = false
        textView.selectable = false
        textView.scrollEnabled = false
        
        textView.sizeToFit()
        textView.layoutIfNeeded()
        
        
        
        var frameSize:CGSize = CGSize(width:rectWidth, height: 300)
        var frame = CGRect(origin:CGPoint(x:xSideBuffer, y:start), size: frameSize)
        textView.frame = frame
        messagesScrollview.addSubview(textView)
        textView.sizeToFit()
        textView.layoutIfNeeded()
        textView.frame.size.height = textView.contentSize.height
        
        return textView.frame.height
    }
    
    func renderImage(message:ImageMessage, start:CGFloat) -> CGFloat{
        var imageObj = UIImage(named: message.path)
        var xSideBuffer:CGFloat = 10
        var rectWidth:CGFloat = UIScreen.mainScreen().bounds.width - xSideBuffer*2
        var height:CGFloat = imageObj!.size.height*rectWidth/imageObj!.size.width
        var imageView = UIImageView(image:imageObj)
        imageView.frame = CGRect(origin:CGPoint(x:xSideBuffer, y:start), size:CGSize(width:rectWidth, height:height))
        messagesScrollview.addSubview(imageView)
        return height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
