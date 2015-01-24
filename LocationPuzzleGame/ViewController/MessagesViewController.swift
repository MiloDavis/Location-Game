//
//  MessagesViewController.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/24/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {
    
    @IBOutlet var messagesScrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        renderMessages([TextMessage(text:"asdfasdfasdfasdfasdf"), ImageMessage(imageName:"field"),ImageMessage(imageName:"field"),ImageMessage(imageName:"field"), TextMessage(text:"asdfasdfasdfasdfasdf"), ImageMessage(imageName:"field"),ImageMessage(imageName:"field"),ImageMessage(imageName:"field")])
        // Do any additional setup after loading the view.
    }
    func renderMessages(messages:[MessageBody]){
        var yStart:CGFloat = 10
        for message in messages{
            if(message.type == "Text"){
                yStart += renderText(message as TextMessage, start: yStart)
            }
            else if(message.type == "Image"){
                yStart += renderImage(message as ImageMessage, start: yStart)
            }
            messagesScrollview.contentSize = CGSize(width:UIScreen.mainScreen().bounds.width, height: yStart)
        }
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
        textView.frame = CGRect(origin:CGPoint(x:xSideBuffer, y:start), size:CGSize(width:rectWidth, height:30))
        messagesScrollview.addSubview(textView)
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
    
    /*func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.world.recievedMessages.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("label") as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Component")
        }
        //var content: String! = self.world.recievedMessages[indexPath.row].subject
        cell.textLabel?.text = nil
        
        return cell
    }
*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
