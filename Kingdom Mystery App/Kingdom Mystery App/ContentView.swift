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
 - NEED A RELIABLE REFRESH AFTER EACH DIALOGUE THING
 
 */


import SwiftUI

//let chars = testingChars();
struct  ContentView: View {
    
    let lochanRed = Color(red: 153.0/255.0, green:68/255.0, blue: 68/255.0);
    let sliavhBlue = Color(red:43.0/255.0, green:85.0/255.0, blue: 153.0/255.0);
    let foroiseGreen = Color(red:56.0/255.0, green:145.0/255.0, blue:51.0/255.0);
    
    @State var page = 0
    let s = Story();
    
    var home: some View{
        map2;
    }
    var map2: some View{ //These will all be map image icons. For now they are color coded by city
        HStack(spacing: -27){
            //red
            Group{
                Button(action:{ if(!s.b.room2.locked){ page = 2 }}){
                    Rectangle().fill(lochanRed).frame(width: 70, height: 70).offset(x:0, y:-40);
                    //Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small).offset(x:0, y:-50)
                }
                Button{ if(!s.b.room2.locked){ page = 6 } } label:{
                    if(s.b.room2.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70);
                    }
                    else{ Rectangle().fill(lochanRed).frame(width: 70, height: 70).offset(x:0, y:40); }
                }
                Button{ if(!s.b.room2.locked){ page = 6 } } label:{
                    if(s.b.room2.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70);
                    }
                    else{ Rectangle().fill(lochanRed).frame(width: 70, height: 70).offset(x:0, y:-40); }
                }
            }
            Spacer();
            //green
            Group{
                Button{ if(!s.b.room3.locked){ page = 4 } } label:{
                    if(s.b.room3.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:40); }
                    else{ Rectangle().fill(sliavhBlue).frame(width: 70, height: 70).offset(x:0, y:40); }
                }
                Button{ if(!s.b.room3.locked){ page = 7 }} label:{
                    if(s.b.room3.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:-40); }
                    else{ Rectangle().fill(sliavhBlue).frame(width: 70, height: 70).offset(x:0, y:-40); }
                }
                Button{ if(!s.b.room3.locked){ page = 7 }} label:{
                    if(s.b.room3.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:40); }
                    else{ Rectangle().fill(sliavhBlue).frame(width: 70, height: 70).offset(x:0, y:40); }
                }
                
            }
            Spacer();
            Group{
                Button{ if(!s.b.room4.locked){ page = 3 } } label:{
                    if(s.b.room4.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:-40);}
                    else{ Rectangle().fill(foroiseGreen).frame(width: 70, height: 70).offset(x:0, y:-40);}
                }
                Button{
                    if(!s.b.room4.locked){ page = 8 }
                } label:{
                    if(s.b.room4.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:40);}
                    else{ Rectangle().fill(foroiseGreen).frame(width: 70, height: 70).offset(x:0, y:40); }
                }
                Button{
                    if(!s.b.room4.locked){ page = 8 }
                } label:{
                    if(s.b.room4.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:-40);}
                    else{ Rectangle().fill(foroiseGreen).frame(width: 70, height: 70).offset(x:0, y:-40); }
                }}
            Spacer();
            Button{
                if(!s.b.room1.locked){ page = 1 }
            } label:{ if(s.b.room1.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:40); }
                else{ Rectangle().fill(.brown).frame(width: 70, height: 70).offset(x:0, y:40); }
            }
        }
    }
   /* var map: some View{ //These will all be map image icons. For now they are color coded by city
        VStack{
            Text("Map");
            HStack{
                Button{
                    if(!s.b.room2.locked){ page = 2 }
                } label:{
                    if(s.b.room2.locked){ Rectangle().fill(.gray).frame(width: 50, height: 50); }
                    else{ Rectangle().fill(lochanRed).frame(width: 50, height: 50); }
                }
                Button{ if(!s.b.room1.locked){ page = 6 }
                } label:{
                    if(s.b.room2.locked){ Rectangle().fill(.gray).frame(width: 50, height: 50);
                    }
                    else{ Rectangle().fill(lochanRed).frame(width: 50, height: 50); }
                }
            }
            HStack{
                Button{
                    if(!s.b.room3.locked){ page = 4 }
                } label:{
                    if(s.b.room3.locked){ Rectangle().fill(.gray).frame(width: 50, height: 50); }
                    else{ Rectangle().fill(sliavhBlue).frame(width: 50, height: 50); }
                }
                Button{
                    if(!s.b.room3.locked){ page = 7 }
                } label:{
                    if(s.b.room3.locked){ Rectangle().fill(.gray).frame(width: 50, height: 50); }
                    else{ Rectangle().fill(sliavhBlue).frame(width: 50, height: 50); }
                }
            }
            HStack{
                Button{
                    if(!s.b.room4.locked){ page = 3 }
                } label:{
                    if(s.b.room4.locked){ Rectangle().fill(.gray).frame(width: 50, height: 50);}
                    else{ Rectangle().fill(foroiseGreen).frame(width: 50, height: 50);}
                }
                Button{
                    if(!s.b.room4.locked){ page = 8 }
                } label:{
                    if(s.b.room4.locked){ Rectangle().fill(.gray).frame(width: 50, height: 50);}
                    else{ Rectangle().fill(foroiseGreen).frame(width: 50, height: 50); }
                }
            }
            HStack{
                Button{
                    if(!s.b.room1.locked){ page = 1 }
                } label:{ if(s.b.room1.locked){ Rectangle().fill(.gray).frame(width: 50, height: 50); }
                    else{ Rectangle().fill(.brown).frame(width: 50, height: 50); }
                }
            }
        }
    }*/
    
    
    @State var tog = false; //toggle dialogue box
    @State var curr_dial = [String](); //current spoken dialogue
    //@State var refresh = true; //general refresh
    @State var strNum = 0; //index of dialogue currently spoken
    
    func showMyBoy(str: Array<String>)-> some View{ //dialogue box toggler
        var ye: some View{
            VStack{
                ZStack{
                    if(strNum<str.count){
                        Text(str[strNum]).foregroundColor(.gray).padding().frame(width:600, height: 100).background(.white).border(.gray).cornerRadius(5).position(x:370, y:280);
                    }
                }
                HStack{
                    Button("<"){
                        if(strNum==0) { strNum=0; }
                        else{ strNum-=1;}
                        self.refresh();
                    }
                    Text("\(strNum+1)/\(str.count)");
                    Button(">"){
                        if(strNum==str.count-1){
                            strNum = 0;
                            tog.toggle()
                        }
                        else{ strNum+=1 }
                        self.refresh();
                    }
                }
            }
        }
        return ye;
    }
    
   
    var room1: some View{ //these room views will be refactored into the room class.
        ZStack{
            let ch = s.b.room1.characters
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
            if(tog){ showMyBoy(str: curr_dial); }
        }
    }
    var room2: some View{
        ZStack{
            let ch = s.b.room2.characters;
            HStack(spacing: 80){
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
            
            if(tog){ showMyBoy(str: curr_dial); }
        }
    }
    
    var room3: some View{
        ZStack{
            //returnTo = 3;
            let ch = s.b.room3.characters
            //VStack{
            HStack(spacing: 80){
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
            let ch = s.b.room4.characters
                HStack(spacing: 80){
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
            
            if(tog){ showMyBoy(str: curr_dial); }
        }
    }
    
    func refresh(){ //these 3 codes are the stupidest thing i have ever written but it's the only way they would work.
        let temp: Int = page;
        page = 0;
        page = temp;
    }
    var lake: some View{
        HStack{
            //objects found here:
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
                Button{
                    crown.located();
                    self.refresh();
                } label:{
                    if(!crown.found){Rectangle().fill(.red).frame(width:40, height:40)}
                    else{Rectangle().fill(.blue).frame(width:40, height:40);}
                }
            
            if(!redBerries.found){ //CURRENTLY NOT REFRESHING PROPERLY
                Button{
                    redBerries.located();
                    self.refresh();
                } label:{ Rectangle().fill(.red).frame(width:40, height:40)}
            } else{
                Rectangle().fill(.blue).frame(width:40, height:40);
            }
        }
        
    }
    var caves: some View{
        HStack{
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
                    self.refresh();
                
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
                    self.refresh();
                    
                } label:{ Rectangle().fill(.red).frame(width:40, height:40)}
            } else{
                Rectangle().fill(.blue).frame(width:70, height:70);
            }
            
        }
    }
    
    var body: some View {
        return Group{
            if(page==0){
                map2
                
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
