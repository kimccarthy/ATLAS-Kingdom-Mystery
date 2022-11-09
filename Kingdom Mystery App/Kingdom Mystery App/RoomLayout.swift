//
//  RoomLayout.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 11/8/22.
//

import Foundation

struct Room{
    var img: String
    var locked: Bool
    var characters: [Char]
    init(i: String, c:[Char]){
        self.img = i
        self.characters = c
        self.locked = false
    }
    /*func unlock(){
        locked = false
    }
    func lock(){
        locked = true
    }
    
    func addCharacter(c: Char){ characters.append(c) }*/
}

class Board{
    var room1: Room
    var room2: Room
    var room3: Room
    var room4: Room
    var rooms: [Room]
    //var ch1: [Char]
    
    init(){
        let ch = Char.chars
        var c:[Char] = []
        ch?.forEach{
            if let charrr = $0{
                c.append(charrr)
            }
            else{
                print("Ah")
            }
        }
        self.room1 = Room(i:"rm1", c:[c[0]])
        self.room2 = Room(i:"rm2", c:[c[2], c[4], c[3]])
        self.room3 = Room(i:"rm3", c:[c[1], c[8]])
        self.room4 = Room(i:"rm4", c:[c[5], c[6], c[7]])
        
        //room1.addCharacter(c: c[0])
        rooms = [room1, room2, room3, room4]
        
    }
    
    
    
}
