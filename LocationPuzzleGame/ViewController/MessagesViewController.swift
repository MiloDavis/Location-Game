//
//  MessagesViewController.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderTextMessage(TextMessage(text:"This is a test to see if newline behavior is still funcitoning properly.  I am hoping that this will work."))
        
        renderImageMessage(ImageMessage(imageName:"field.png"))
        // Do any additional setup after loading the view.
    }
    // Renders a TextMessage
    func renderTextMessage(message:TextMessage) -> CGFloat{
        var xSideBuffer:CGFloat = 10
        var textView = UITextView()
        var rectWidth:CGFloat = UIScreen.mainScreen().bounds.width - xSideBuffer*2
        textView.text = message.text
        // Preferences
        textView.hidden = false
        textView.editable = false
        textView.selectable = false
        textView.scrollEnabled = false
        textView.frame = CGRect(origin:CGPoint(x:xSideBuffer, y:100), size:CGSize(width:rectWidth, height:100))
        self.view.addSubview(textView)
        return textView.frame.width
    }
    
    func renderImageMessage(message:ImageMessage) -> CGFloat{
        var imageObj = UIImage(contentsOfFile: message.path)
        var xSideBuffer:CGFloat = 10
        var rectWidth:CGFloat = UIScreen.mainScreen().bounds.width - xSideBuffer*2
        var height:CGFloat = imageObj!.size.height*rectWidth/imageObj!.size.width
        var imageView = UIImageView(image:imageObj)
        imageView.frame = CGRect(origin:CGPoint(x:xSideBuffer, y:100), size:CGSize(width:rectWidth, height:height))
        self.view.addSubview(imageView)
        return CGFloat(4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}