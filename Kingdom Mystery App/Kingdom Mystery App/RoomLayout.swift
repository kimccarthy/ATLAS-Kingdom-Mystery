//
//  RoomLayout.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 11/8/22.
//

import Foundation

class Room{
    var img: String
    var locked: Bool
    var characters: [Char]
    init(i: String, c:[Char]){
        self.img = i
        self.characters = c
        self.locked = false
    }
    
    /*func display(c: ContentView): some View{
        
    }*/ //TRANSFER TO THIS
    func setChars(chrs: Array<Char>){ characters = chrs; }
}


class Board{
    var room1: Room
    var room2: Room
    var room3: Room
    var room4: Room
    var rooms: [Room]
    
    
    
    let mon1 = ["Hello, dear traveler. Leonore has told me about your presence. I am King Aleold.","It has been a while since we have gotten visitors around here. Since the diamond was stolen, really.", "In fact, may I ask a request of you?","The Diamond of Lochan was a priceless treasure passed down through the ages. Years ago, it was stolen from this very room.", "Back then, I and the two other monarchs of this land ruled jointly over all its people.", "We ruled over each of its regions; Lochan, land of the lakes that you have seen.","Sliavh, land of the mountains","and Foroise, land of the forest.","I did not think there was unrest between our regions, but I am left to believe that one of the subjects of another region stole the gem.","The leaders both denied that their citizens would ever steal it.","They turned against each other, and thus our kingdom was split in three.","No citizens travel between nowadays.","But you traveler, can.","Would you help me find the culprit?","Excellent, my thanks to you.", "There is a note on the pedestal where the diamond sat. You can use that as your first clue.","I will also send word to the other kingdoms to let you in. You may visit them at will.", "[You now have access to ALL KINGDOMS]"]
    let idle1 = ["Report back to me when you've discovered more information. My thanks."]
    let mon2 = ["So. You must be the famed traveler sent by the Lochan king.","Welcome to Sliavh. I am Queen Regina.", "You are welcome here, for I know that your investigation will prove the innocence of Sliavh.", "I'm sure my citizens would be happy to answer any questions you might have."]
    let idle2 = ["I'm sure my citizens would be happy to answer any questions you might have."]
    let mon3 = ["Ohohoh, so the bloody Lochan still won't let his diamond go? It's been five years.","And not only that, but he refuses to believe my word?","What Foroisian worth his salt would steal. Much less steal something as trivial as a diamond.", "Ah apologies, my emotions may have got the best of me. I am King Fabien.","That blasted Lochan King sent you, did he?", "Do you worst, I say! My citizens didn't do it."]
    let idle3 = ["Do you worst, I say! My citizens didn't do it."]
    

    var monarch1: Monarch;
    var monarch2: Monarch;
    var monarch3: Monarch;
    
    init(){
        let ch = Char.chars
        var c:[Char] = []
        ch?.forEach{
            if let charrr = $0{
                c.append(charrr)
            }
            else{
                print("Error Appending Chars")
            }
        }
        self.monarch1 = Monarch(i: "penguin", d:0, dl: mon1, idl: idle1);
        self.monarch2 = Monarch(i: "penguin", d:0, dl: mon2, idl: idle2);
        self.monarch3 = Monarch(i: "penguin", d:0, dl: mon3, idl: idle3);
        self.room1 = Room(i:"rm1", c:[c[0]]) //beaver
        self.room2 = Room(i:"rm2", c:[c[2], c[4], c[3]]) //i think hero princess baker
        self.room3 = Room(i:"rm3", c:[c[1], c[6], c[8]]) //elephant, priest, thief
        self.room4 = Room(i:"rm4", c:[c[5], c[7]]) //blacksmith artist
        room2.locked = true; //janky janky janky
        room3.locked = true;
        room4.locked = true;
        rooms = [room1, room2, room3, room4]
        
    }
    
    
    
}
