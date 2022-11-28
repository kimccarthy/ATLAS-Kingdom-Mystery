//
//  ContentView.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/7/22.
//


/**
 
 NOTES TO SELF:
 
 Assets Needed:
 - Objects:
        - Diamond
        - Potion
        - Note
        - Red Berries
        - Green Berries
        - Invoice
        - Recipe
        - Crown
        - Statue
        - Letters
        - Chest
        - Cake??
 - Backgrounds:
     - Lochan Main
     - Sliavh Main (x3? I'm tempted to change the dialogue.)
     - Foroise Main
     - Throne Room (x3, different colors for decorations (dark gray back?)
     - Lake
     - Cave
     - Mountain
 
 PEOPLE:
 - Lioness (with/without crown?)
 - Elephant
 - Royalty (lion/deer)
 
 Various and Assorteds:
    - Red Berry bushes (with and without the berries on them)
    - Pedestals:
            - For statue
            - For diamond (that has vault note currently)
 - Map Icons
 - Map Background
 - Inventory Background
 - Cake object???
 - locking rooms (i mean this will just be one boolean unlocked after the king talks in lochan)
 - Once you have the king, diamond toggle for dialogue.
 - priest is in the wrong room i REPEAT PRIEST IS IN THE WRONG ROOM
            -
 
 
 THINGS TO DO:
 - Figure out refresh issue
 - Royalty
 - Obviously import everything file wise. Dumbass bitch didn't download the pixel art app. Do at O's tomorrow?
 - Overloaded update function which will probably be my task right now. Then adjusting story/length as need be.
 - Add dialogue boxes for finding objects or story progression beyond talking to NPCs
 - Or at the very least add an "[_____ ADDED TO INVENTORY] _ for NPC dialogue.
 - When have wifi, find if there's a way to use device length/width for placing stuff
 - Cake object????
 - Moving characters between rooms.
 - Inventory toggle is fucky
 */


import SwiftUI

//let chars = testingChars();
struct  ContentView: View {
    @State var page = 0
    let s = Story();
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
            Button("Lake"){
                page = 6
            }
            Button("Cave"){
                page = 7
            }
            Button("Mountain"){
                page = 8;
            }
            
        }
    }
    @State var tog = false;
    @State var curr_dial = [String](); //in which case we can use it in the func
   // @State var returnTo: Int = 0;
    var room1: some View{
        ZStack{
            let ch = s.b.room1.characters
            //returnTo = 1;
            
            //VStack{
                HStack{
                    Menu{
                        Button("Inventory", action:{page = 5});
                        Button("Map", action:{
                            page = 0
                            tog = false;
                        });
                    } label:{
                        Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                    }
                    ForEach(0..<ch.count){ k in
                        Menu{
                            ForEach(0..<s.options(c: ch[k]).count){ i in
                                Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: {
                                    curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                    s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                    tog = true;
                                    strNum = 0;
                                }
                                );
                            }
                        } label:{
                            Image(ch[k].img).resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                        }
                        
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
                    
                        if(strNum==str.count-1){
                            strNum = 0;
                            tog.toggle()
                        }
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
        ZStack{
            //returnTo = 2;
            let ch = s.b.room2.characters;
            //VStack{
                HStack{
                    Menu{
                        Button("Inventory", action:{page = 5});
                        Button("Map", action:{
                            page = 0
                            tog = false;
                        });
                    } label:{
                        Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                    }
                    ForEach(0..<ch.count){ k in
                        Menu{
                            ForEach(0..<s.options(c: ch[k]).count){ i in
                                Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: {
                                    curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                    s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                    tog = true;
                                    strNum = 0;
                                    //print(tog, curr_dial);
                                }
                                );
                            }
                        } label:{
                            Image(ch[k].img).resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                        }
                        
                    }
                    
                   
                    }
            
            if(tog){
                showMyBoy(str: curr_dial);
            }
        }
    }
    
    var room3: some View{
        ZStack{
            //returnTo = 3;
            let ch = s.b.room3.characters
            //VStack{
            HStack{
                Menu{
                    Button("Inventory", action:{page = 5});
                    Button("Map", action:{
                        page = 0;
                        tog = false;
                    });
                } label:{
                    Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                }
                ForEach(0..<ch.count){ k in
                    Menu{
                        ForEach(0..<s.options(c: ch[k]).count){ i in
                            Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: { //BREAK HERE OMETHING HAPPENED!!!!
                                curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                tog = true;
                                strNum = 0;
                                //print(tog, curr_dial);
                            }
                            );
                        }
                    } label:{
                        Image(ch[k].img).resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                    }
                    
                }}
            if(tog){
                showMyBoy(str: curr_dial);
            }
        }
    }
    
    var room4: some View{
        ZStack{
            //returnTo = 4;
            let ch = s.b.room4.characters
            //VStack{
            
                HStack{
                    Menu{
                        Button("Inventory", action:{print("Inventory")});
                        Button("Map", action:{
                            page = 0;
                            tog = false;
                        });
                    } label:{
                        Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                    }
                    ForEach(0..<ch.count){ k in
                        Menu{
                            ForEach(0..<s.options(c: ch[k]).count){ i in
                                Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: {
                                    curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                    s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                    tog = true;
                                    strNum = 0;
                                    //print(tog, curr_dial);
                                }
                                );
                            }
                        } label:{
                            Image(ch[k].img).resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
                        }
                        
                    }
                }
            
            if(tog){
                showMyBoy(str: curr_dial);
            }
        }
    }
    
    var lake: some View{
        HStack{//need RED BERRIES AS WELL. I think display bushes instead of general silhouette. Both will need overloaded update function calls
            //returnTo = 6;
            let crown = s.inv.crown;
            let redBerries = s.inv.redBerries;
            Menu{
                Button("Inventory", action:{page = 5});
                Button("Map", action:{
                    page = 0
                    tog = false;
                });
            } label:{
                Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
            }
            if(!crown.found){ //CURRENTLY NOT REFRESHING PROPERLY
                Button{
                    crown.located();
                    refresh.toggle();
                    tog = false;
                    page = 6;
                } label:{ Rectangle().fill(.red).frame(width:40, height:40)}
            } else{
                Rectangle().fill(.blue).frame(width:40, height:40);
            }
            
            if(!redBerries.found){ //CURRENTLY NOT REFRESHING PROPERLY
                Button{
                    redBerries.located();
                    refresh.toggle();
                    tog = false;
                    page = 6;
                } label:{ Rectangle().fill(.red).frame(width:40, height:40)}
            } else{
                Rectangle().fill(.blue).frame(width:40, height:40);
            }
        }
        
    }
    var caves: some View{
        HStack{
            //returnTo = 7;
            let recipe = s.inv.recipe;
            let invoice = s.inv.invoice;
            //gotta make a chest or paper pile image that encompasses the above.
            //big problem here is puzzle.
            //layout: first, a cave. on click, puzzle.
            //second, an open cave. inside, the pile of papers. On click, recieve the documents.
            Menu{
                Button("Inventory", action:{page = 5});
                Button("Map", action:{
                    page = 0
                    tog = false;
                });
            } label:{
                Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
            }
            if(!recipe.found){ //CURRENTLY NOT REFRESHING PROPERLY
                Button{
                    recipe.located();
                    invoice.located();
                
                } label:{ Rectangle().fill(.red).frame(width:40, height:40)}
            } else{
                Rectangle().fill(.blue).frame(width:70, height:70);
            }
        }
    }
    
    var mountain: some View{
        HStack{
            //returnTo = 8;
            //this will be the handler of the statue but the statue is not found here.
            //when everything is more fleshed out, when this has a pedestal and the statue is in possesion then it can be placed.
            //i really gotta figure out dialogue. For like "you found a ____!" stuff.
            //On placing, pedestal for statue opens and there's a chest.
            
            //need pedestal image.
            let chest = s.inv.chest;
            Menu{
                Button("Inventory", action:{page = 5});
                Button("Map", action:{
                    page = 0
                    
                });
            } label:{
                Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small)
            }
            if(!chest.found){ //CURRENTLY NOT REFRESHING PROPERLY
                Button{
                    chest.located();
                    
                } label:{ Rectangle().fill(.red).frame(width:40, height:40)}
            } else{
                Rectangle().fill(.blue).frame(width:70, height:70);
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
            else if(page==4){
                room4
            }
            else if(page==5){
                s.inv.display(c: self, ret: 0);
            }
            else if(page==6){
                lake
            }
            else if(page==7){
                caves
            }
            else if(page==8){
                mountain
            }
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
