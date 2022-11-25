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
    @State var tog = false;
    @State var curr_dial = [String](); //in which case we can use it in the func
    var room1: some View{
        ZStack{
            let b = Board()
            let ch = b.room1.characters
            
            
            VStack{
                
                ForEach(0..<ch.count){ k in
                    Menu{
                        ForEach(0..<ch[k].getOptions().count){ i in
                            Button(ch[k].getOptions()[ch[k].getOptions().count-i-1], action: {
                                curr_dial = ch[k].dialogue(i: 4)!;
                                tog.toggle();
                                print(tog, curr_dial);
                            }
                            );
                        }
                    } label:{
                        Image(ch[k].img).resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                    }
                    
                }
                
                Button("<Back"){
                    page = 0
                }
                
            }
            if(tog){
                showMyBoy(str: curr_dial);
            }
        }
        
    }
    @State var refresh = true;
    @State var strNum = 0;
    func showMyBoy(str: Array<String>)-> some View{
        //print("begin");
        var ye: some View{
            VStack{
                //var num = 0;
               
                ZStack{
                    /*switch(strNum){
                    case(strNum<str.count):
                        Text(str[strNum]).foregroundColor(.gray).padding().frame(width:300, height: 200).background(.white).border(.gray).cornerRadius(5).position(x:200, y:600);
                    case(strNum==str.count):
                        Text("");
                        tog.toggle();
                    default:
                        Text("");
                    }*/

                    if(strNum<str.count){
                        Text(str[strNum]).foregroundColor(.gray).padding().frame(width:300, height: 200).background(.white).border(.gray).cornerRadius(5).position(x:200, y:600);
                    }
                    
                }
                HStack{
                    Button("<"){
                        if(strNum==0) { strNum=0; }
                        else{ strNum-=1;}
                        refresh.toggle();
                    }
                    Text("\(strNum+1)/\(str.count)");
                    Button(">"){
                    
                        if(strNum==str.count-1){ tog.toggle() }
                        else{ strNum+=1 }
                        refresh.toggle();
                        
                    }
                    
                }
                
            }
        }
       // print("hitting")
        return ye
        
    }
    var room2: some View{
        VStack{
          let b = Board()
          let ch = b.room2.characters
            if let c = ch[0]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
            if let c = ch[1]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
            if let c = ch[2]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
            Button("<Back"){
                page = 0
            }
            
        }
    }
    
    var room3: some View{
        VStack{
            let b = Board()
            let ch = b.room3.characters
            if let c = ch[0]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
            if let c = ch[1]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
            Button("<Back"){
                page = 0
            }
            
        }
    }
    
    var room4: some View{
        VStack{
           let b = Board() //gonna nee
            let ch = b.room4.characters
            if let c = ch[0]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
            if let c = ch[1]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
            if let c = ch[2]{Button(action: {
                print("\(c.name) pressed")
            }) {
                Image(c.img).resizable().frame(width: 50.0, height: 60.0).imageScale(.small)
            }}
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
