//
//  ContentView.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/7/22.
//

import SwiftUI

//let chars = testingChars();
struct  ContentView: View {
    @State var page = 0
    
    var inRoom = false
    var home: some View{
        
        VStack{
            Button("Room 1") {
                page = 1
            }
            Button("Room 2"){
                page = 2
            }
            Button("Room 3"){
                page = 3
            }
            Button("Room 4"){
                page = 4
            }
        }
    }
    
    var allOfThem: some View{
        VStack{
           
            if let chars = Char.chars{
                if let c = chars[0] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[1] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[2] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[3] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[4] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[5] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[6] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[7] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                if let c = chars[8] {Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
                Button("< Back"){
                    page = 0
                }
            } else{
                Text("Error")
            }
                }
        
    }
    var room1: some View{
        VStack{
            let b = Board()
            let ch = b.room1.characters
            if let c = ch[0]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            Button("<Back"){
                page = 0
            }
            
        }
    }
    var room2: some View{
        VStack{
          let b = Board()
          let ch = b.room2.characters
            if let c = ch[0]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            if let c = ch[1]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            if let c = ch[2]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            Button("<Back"){
                page = 0
            }
            
        }
    }
    
    var room3: some View{
        VStack{
            let b = Board()
            let ch = b.room3.characters
            if let c = ch[0]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            if let c = ch[1]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            Button("<Back"){
                page = 0
            }
            
        }
    }
    
    var room4: some View{
        VStack{
           let b = Board() //gonna nee
            let ch = b.room4.characters
            if let c = ch[0]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            if let c = ch[1]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            if let c = ch[2]{Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)}
            Button("<Back"){
                page = 0
            }
            
        }
    }
    var body: some View {
        return Group{
            if(page==0){
                home
                
            }
            else if(page==1){
                room1
            }
            else if(page==2){
                room2
                
            }
            else if(page==3){
                room3
            }
            else{
                room4
            }
            
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
