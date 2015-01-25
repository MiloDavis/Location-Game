//
//  Puzzles.swift
//  LocationPuzzleGame
//
//  Created by Jack Frysinger on 1/25/15.
//  Copyright (c) 2015 Jack Frysinger. All rights reserved.
//

import Foundation
import CoreLocation

 class Content {
    
    var p0 : Puzzle
    var p1 : Puzzle
    var p2 : Puzzle
    var p3 : Puzzle
    var p4 : Puzzle
    var p5 : Puzzle
    var p6 : Puzzle
    var p7 : [Message]
    var p0_m1 = Message(body: TextMessage(text: "We have detected activity on your account. Is this you, Adams?"), id: "p0_m1")
    
    var p0_m2 = Message(body: TextMessage(text: "Good to hear from you again. What the heck happened to you?"), id: "p0_m2")
    
    var p0_m3 = Message(body: TextMessage(text: "You don’t know? Perfect. Maybe the enemy got to you somehow. You take too many freedoms you know. You need to be more careful. Anyway, your absence has set us way behind. What do we do now?"), id: "p0_m3")
    
    var p0_m4 = Message(body: TextMessage(text: "We can pick up where we left off I suppose. It’s as good as anything. The enemy is probably miles ahead of us by now."), id: "p0_m4")
    
    var p0_m5 = Message(body: TextMessage(text: "You might still be compromised, so that is not for you to know…yet. We’re glad to have you back, and we hope you’ll be fully operational in a few days. For now, we should arrange an introductory meeting to help jog your memory. Meet me at the Boston Public Library, 700 Boylston Street, and I will contact you there. Let’s get you back out there"), id: "p0_m5")
    

    
    // On way to library
    var p1_m1 = Message(body: TextMessage(text: "As is standard procedure, we cannot physically engage, as that would imply our association. I can send you files and information better and more securely if we are in the same room, which is why meeting in person is still important to our organization."), id: "p1_m1")
    var p1_m2 = Message(body: TextMessage(text: "I suppose I should fully tell you what's going on. You are a high ranking member of the Obscuri. The Obscuri are a splinter cell of the Illuminati that evolved in 1785 when Karl Theodore gained power in Bavaria. Theodore saw the danger of a group that was starting to garner so much control against him, and banned all secret societies; however, they tend to be a bit difficult to eradicate. Some members of the Illuminati thought they could turn a quick profit by turning themselves over to Theodore's service, to help him root out the societies."), id: "p1_m2")
    var p1_m3 = Message(body: TextMessage(text: "Their efforts worked in Bavaria, but not before some members survived and spread about the world. Since then, the Obscuri have been locked in a struggle with the Illuminati, trying to keep the world safe from their tyranny."), id: "p1_m3")

    // Arrival at Library
    var p1_m4 = Message(body: TextMessage(text: "We fight primarily by intercepting their files and raiding their data stores. We can only breach their connections by being in close proximity, and the stores can only be accessed by being in a speific location. They often encode their locations and plans, so we crack them, and take what we want. Does any of that sound familiar?"), id: "p1_m4")
    var p1_m5 = Message(body: TextMessage(text: "Damn! We've been breached. I just got word the Illuminati are snooping around, it's a matter of time until they pick up our signal. I'm sending a file we intercepted a few days ago. If you can figure it out, we'll reinstate your status. If you fail, you will be erased. We'll keep a close eye on your phone signal, and if you enter the right location we'll contact you. Good luck."), id: "p1_m5")
    var p1_m6 = Message(body: TextMessage(text: "Jnqfibegu\nZvqavtug\nYvar"), id: "p1_m6")
    
    
    // Arrival at North Church
    var p2_m1 = Message(body: TextMessage(text: "You’ve made it. Congratulations. You are officially a field agent again. Nice job cracking the code. We have another one for you. We were able to extract an image and message from this data store indicating this will be the location of the next major information transfer. We need you to figure this out, and be there in time. You’ll hear from us when you get there. Keep up the good work."), id: "p2_m1")
    var p2_m2 = Message(body: ImageMessage(imageName: "puzzle"), id: "p2_m2")
    var p2_m3 = Message(body: TextMessage(text: "The number of squares is the number you seek\nbut that is not all, the horizon not bleak\nBetween three towers lies the answer you desire\nA beacon for politics, to lift our lives higher"), id: "p2_m3")
    
    
    // Arrival at Mass St House
    var p3_m1 = Message(body: TextMessage(text: "Stop. We found two heavily encrypted signals in the area, you should be in the right place. Got it. Get out of there as fast as you can. We don’t know of any more upcoming activity, so I’m not sure what to do now."), id: "p3_m1")
    var p3_m2 = Message(body: TextMessage(text: "You could meet with Washington. He’s in talks with an associate right now. You can find them at the Prudential Center. Good luck."), id: "p3_m2")
    
    
    // Arrival at Prudential
    var p4_m1 = Message(body: TextMessage(text: "Stop. This is an Obscuri signal. What are you doing here?"), id: "p4_m1")
    var p4_m2 = Message(body: TextMessage(text: "The agent who was reinstated recently? I was the one who approved that. You sound like you're recovering quickly, but I don't have the time to deal with you right now."), id: "p4_m2")
    var p4_m3 = Message(body: TextMessage(text: "My associate is a corporate investor. Obscuri is a multinational corporation, and incurs a lot of expense. We accept help wherever we can get it. Get on your mission. It’s not your job to ask questions."), id: "p4_m3")
    var p4_m4 = Message(body: TextMessage(text: "7 A trail in Boston 1st\n12 official acceptance of a document by a government 2nd\n12 written in 1787 in Philadelphia 12th\n8 _________ of Confederation 7th\n5 In God we _______ 3rd\n9 A legislative body that has two chambers 2nd\n4 Betsy Ross made the first _______ 3d"), id: "p4_m4")
    
    
    // Arrival at Faneuil Hall
    var p5_m1 = Message(body: TextMessage(text: "Impressive. There is a large data cache here. Amongst what we found was a text file with an odd message. We sent it to your files folder. It’s on you now."), id: "p5_m1")
    var p5_m2 = Message(body: TextMessage(text: "Peer into Boston's emerald pride\nThere is a grounds there which does reside\nA stage erects each year beneath trees\nwhere the public saw hangings, heard choked pleas\nThese arbors next to those of great liberty\nand a victory column for all to see"), id: "p5_m2")
    
    
    // Arrival at Boston Common
    var p6_m1 = Message(body: TextMessage(text: "This is it. We have enough information to suppress the Illuminati for a long time to come. Nice work. If you want to add insult to injury, there seems to be one more file. We’ve sent it to you. Take it if you want. We’ll contact you if we need your service again. Thank you. You’ve done a great thing."), id: "p6_m1")
    var p6_m2 = Message(body: TextMessage(text: "In 1614 he landed so\nTwas John Smith, who said \"Land ho\"\nThe waves did leap and the see did spray\nHis followers arrived and now boats sway\nA place for trade of leaves and spice\nwhich all went over one dark night\n\nOn the beach is a place forgotten in lore\nA base built four times, then four times once more\nBattery, Fortification, and Penitentiary through time\nbut our men of note committed no crime\nPrince Hall led fourteen men to the freemason way\nTheir values live on in us today"), id: "p6_m2")
    
    
    // Arrival at Castle Island
    var p7_m1 = Message(body: TextMessage(text: "Haven’t you done enough? Or better yet, do you even know what you’ve done? Go check your files right now. I think you’ll be…enlightened"), id: "p7_m1")
    var p7_m2 = Message(body: TextMessage(text: "BREAKING NEWS: Richard Nixon on track to eliminate world hunger"), id: "p7_m2")
    var p7_m3 = Message(body: TextMessage(text: "Nice job, men. We've gotten another victory for the Obscuri through the impeachment of Mr. Nixon."), id: "p7_m3")
    var p7_m4 = Message(body: TextMessage(text: "BREAKING NEWS: Vietnamese scientists begin testing a general cure for cancer"), id: "p7_m4")
    var p7_m5 = Message(body: TextMessage(text: "Good news, boys, the Obscuri has gotten Lyndon B. Johnson in on our plan of action for eliminating the potentially disruptive research occurring in Vietnam."), id: "p7_m5")
    var p7_m6 = Message(body: TextMessage(text: "BREAKING NEWS: NYC whistleblower claims hard evidence of massive worldwide organization puppetteering global events"), id: "p7_m6")
    var p7_m7 = Message(body: TextMessage(text: "That one was close, thank goodness we had an operative prepared to orchestrate some chaos in New York City while eliminating the evidence. Can we have a round of applause for Osama?"), id: "p7_m7")
    var p7_m8 = Message(body: TextMessage(text: "\nThis is what you've been helping. I hope it was worth whatever they paid you. Now the world will remain in the dark forever."), id: "p7_m8")
    var p7_m9 = Message(body: TextMessage(text: "He's right you know."), id: "p7_m9")
    var p7_m10 = Message(body: TextMessage(text: "Yes. We overthrow governments. We rig elections and ensure less regulation on business, and in return we get vast sums of money. It’s a way to make a living. Something you chose to no longer do. Watch your back Adams. You just may be next."), id: "p7_m10")
    
    init() {
        p0_m1.delivered = true
        p0_m2.delivered = true
        p0_m3.delivered = true
        p0_m4.delivered = true
        p0_m5.delivered = true
        self.p0 = Puzzle(location: CLLocationCoordinate2D(latitude: 42.349564, longitude: -71.077840), messages: [p0_m1, p0_m2, p0_m3, p0_m4, p0_m5], triggers: [])
        self.p1 = Puzzle(location: CLLocationCoordinate2D(latitude: 42.366433, longitude: -71.054330), messages: [p1_m1, p1_m2, p1_m3, p1_m4, p1_m5, p1_m6], triggers: [TimeTrigger(id: "p1_t1", messageID: "p1_m1", delay: 180, calling: "p1_t2"),TimeTrigger(id: "p1_t2", messageID: "p1_m2", delay: 120, calling: "p1_t3"),TimeTrigger(id: "p1_t3", messageID: "p1_m3", delay: 180, calling: "")])
        self.p2 = Puzzle(location: CLLocationCoordinate2D(latitude: 42.358932, longitude: -71.063767), messages: [p2_m1, p2_m2, p2_m3], triggers: [])
        self.p3 = Puzzle(location: CLLocationCoordinate2D(latitude: 42.348690, longitude: -71.082719), messages: [p3_m1, p3_m2], triggers: [])
        self.p4 = Puzzle(location: CLLocationCoordinate2D(latitude: 42.360295, longitude: -71.082719), messages: [p4_m1, p4_m2, p4_m3, p4_m4], triggers: [])
        self.p5 = Puzzle(location: CLLocationCoordinate2D(latitude: 42.355283, longitude: -71.065582), messages: [p5_m1, p5_m2], triggers: [])
        self.p6 = Puzzle(location: CLLocationCoordinate2D(latitude: 42.338200, longitude: -71.010718), messages: [p6_m1, p6_m2], triggers: [])
        self.p7 = [p7_m1, p7_m2, p7_m3, p7_m4, p7_m5, p7_m6, p7_m7, p7_m8, p7_m9, p7_m10]
    }
}