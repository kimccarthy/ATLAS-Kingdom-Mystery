//
//  ContentView.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/7/22.
//


/**
Remaining Assets:
 - Paper pile
 - Cave
 - Vault Note Inv
 - checkmark
- Letters
 - Invoice
 
 Need to solve:
 - Characters moving
 - That one seg fault
 - Making sure strNum is reset
 
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
                Button(action:{ page = 2 }){
                    Rectangle().fill(lochanRed).frame(width: 70, height: 70).offset(x:0, y:-40);
                    //Image("redpanda").resizable().frame(width: 70.0, height: 80.0).imageScale(.small).offset(x:0, y:-50)
                }
                Button{ page = 6 } label:{ Rectangle().fill(lochanRed).frame(width: 70, height: 70).offset(x:0, y:40); }
                
                //Button{ if(!s.b.room2.locked){ page = 9 } }
                Button{ if(true){ page = 9 } }label:{
                    if(/*s.b.room2.locked*/true){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:-40);
                    }
                    else{ Rectangle().fill(lochanRed).frame(width: 70, height: 70).offset(x:0, y:-40); }
                }
            }
            Spacer();
            //green
            Group{
                //Button{ if(!s.b.room3.locked){ page = 4 } }
                Button{ if(true){ page = 4 } }label:{
                    if(/*s.b.room3.locked*/false){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:40); }
                    else{ Rectangle().fill(sliavhBlue).frame(width: 70, height: 70).offset(x:0, y:40); }
                }
                //Button{ if(!s.b.room3.locked){ page = 7 }}
                Button{ if(true){ page = 8 }} label:{
                    if(/*s.b.room3.locked*/false){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:-40); }
                    else{ Rectangle().fill(sliavhBlue).frame(width: 70, height: 70).offset(x:0, y:-40); }
                }
                Button{ if(/*!s.b.room3.locked*/true){ page = 8 }} label:{
                    if(/*s.b.room3.locked*/false){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:40); }
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
                    if(!s.b.room4.locked){ page = 7 }
                } label:{
                    if(s.b.room4.locked){ Rectangle().fill(.gray).frame(width: 70, height: 70).offset(x:0, y:40);}
                    else{ Rectangle().fill(foroiseGreen).frame(width: 70, height: 70).offset(x:0, y:40); }
                }
                Button{
                    if(!s.b.room4.locked){ page = 7 }
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
    
    @State var tog = false; //toggle dialogue box
    @State var curr_dial = [String](); //current spoken dialogue
    @State var strNum = 0; //index of dialogue currently spoken
    @State var diamondActivated = false;
    
    //***HELPERS***
    
    func refresh(){ //these 3 lines of code are the stupidest thing i have ever written but it's the only way they would work.
        let temp: Int = page;
        page = 0;
        page = temp;
    }
    
    func showDialogueBox(str: Array<String>)-> some View{ //dialogue box toggler
        var dialBox: some View{
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
                            self.refresh();
                        }
                        else{ strNum+=1 }
                        self.refresh();
                    }
                }
            }
        }
        return dialBox;
    }
    
   
    var room1: some View{ //these room views will be refactored into the room class.
        ZStack{
            let ch = s.b.room1.characters
                HStack{
                    playerChar();
                    ForEach(0..<ch.count, id: \.self){ k in
                        Menu{
                            ForEach(0..<s.options(c: ch[k]).count, id: \.self){ i in
                                Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: {
                                    curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                    s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                    tog = true;
                                    strNum = 0;
                                }
                                );
                            }
                        } label:{
                            Image(ch[k].img).resizable().frame(width: 90.0, height: 100.0).imageScale(.small).shadow(color: .black, radius: 10)
                        }
                    }
                }
            if(tog){ showDialogueBox(str: curr_dial); }
        }
    }
    var room2: some View{
        Image("redtown").resizable().opacity(0.7).ignoresSafeArea().overlay(
        ZStack{
            let ch = s.b.room2.characters;
            HStack(spacing: 80){
                playerChar().offset(x: 0, y:50);
                    ForEach(0..<ch.count, id: \.self){ k in
                        Menu{
                            ForEach(0..<s.options(c: ch[k]).count, id: \.self){ i in
                                Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: {
                                    curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                    s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                    tog = true;
                                    strNum = 0;
                                }
                                );
                            }
                        } label:{
                            Image(ch[k].img).resizable().frame(width: 90.0, height: 100.0).imageScale(.small).shadow(color: .black, radius: 10)
                        }
                        
                    }
                    }
            
            if(tog){ showDialogueBox(str: curr_dial); }
        })
    }
   
    func playerChar()-> some View{
        Menu{
            Button("Inventory", action:{page = 5});
            Button("Map", action:{
                page = 0;
                tog = false;
            });
        } label:{
            Image("redpanda").resizable().frame(width: 90.0, height: 100.0).imageScale(.small).shadow(color: .black, radius: 10)
        }
    }
    var room3: some View{
        Image("greentown").resizable().opacity(0.7).ignoresSafeArea().overlay(
        ZStack{
            //returnTo = 3;
            let ch = s.b.room3.characters
            //VStack{
            HStack(spacing: 80){
                playerChar();
                ForEach(0..<ch.count, id: \.self){ k in
                    Menu{
                        ForEach(0..<s.options(c: ch[k]).count, id: \.self){ i in
                            Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: {
                                curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                tog = true;
                                strNum = 0;
                            }
                            );
                        }
                    } label:{
                        Image(ch[k].img).resizable().frame(width: 90.0, height: 100.0).imageScale(.small).shadow(color: .black, radius: 10)
                    }
                    
                }}
            if(tog){
                showDialogueBox(str: curr_dial);
            }
        })
    }
   
    var room4: some View{
        Image("bluetown").resizable().opacity(0.7).ignoresSafeArea().overlay(
        ZStack{
            let ch = s.b.room4.characters
                HStack(spacing: 80){
                    playerChar();
                    ForEach(0..<ch.count, id: \.self){ k in
                        Menu{
                            ForEach(0..<s.options(c: ch[k]).count, id: \.self){ i in
                                Button(s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], action: {
                                    curr_dial = s.dialogue(str: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1], c: ch[k])!;
                                    s.update(char: ch[k], option: s.options(c: ch[k])[s.options(c: ch[k]).count-i-1]);
                                    tog = true;
                                    strNum = 0;
                                }
                                );
                            }
                        } label:{
                            Image(ch[k].img).resizable().frame(width: 90.0, height: 100.0).imageScale(.small).shadow(color: .black, radius: 10)
                        }
                        
                    }
                }
            
            if(tog){ showDialogueBox(str: curr_dial); }
        })
    }
    
    
    
    var redRoyal: some View{
        Image("redthrone").resizable().opacity(0.7).ignoresSafeArea().overlay(
        ZStack{
            HStack{
                let vaultNote = s.inv.note;
                playerChar().offset(x:-200,y:85);
                let vn = Button{
                    vaultNote.located();
                    self.refresh();
                } label:{ Image("pedestalwNote").resizable().frame(width:130, height:130).shadow(color:.black, radius: 10)}
                if(!vaultNote.found){
                    vn.offset(x:-150, y: 60)
                } else{
                    Image("pedestal").resizable().frame(width:130, height:130).shadow(color:.black, radius: 10).offset(x:-150, y: 60)
                }
                
               let mon =  Button{
                    if(!s.storyStart){
                        //diamondActivated = true;
                        tog = true;
                        curr_dial = s.b.monarch1.dial;
                        s.b.room3.locked = false;
                        s.b.room4.locked = false;
                        s.storyStart = true;
                        self.refresh();
                    }
                    else{
                        if(!tog){
                            tog = true;
                            curr_dial = s.b.monarch1.idle;
                            self.refresh();
                        }
                    }
                } label:{
                    Image(s.b.monarch1.img).resizable().frame(width: 90.0, height: 100.0).imageScale(.small).shadow(color:.black, radius: 10)
                }
                mon.offset(x:190, y:-35);
                
            }
            if(tog){
                showDialogueBox(str: curr_dial);
            }
            
        })
    }
    
    var lake: some View{
        Image("lake").resizable().opacity(0.7).ignoresSafeArea().overlay(
        ZStack{
            HStack{
                //objects found here:
                let crown = s.inv.crown;
                let redBerries = s.inv.redBerries;
                Image("bush").resizable().frame(width:120, height:120).offset(x:-170,y:100);
                //playerChar(x:100,y:250);
                playerChar().offset(x:-130, y: 100);
                
                let crwn = Button{
                    crown.located();
                    tog = false;
                    curr_dial = ["You picked up a CROWN"]
                    tog = true;
                    self.refresh();
                } label:{
                    Image("crown").resizable().frame(width:60, height:60).shadow(radius: 10)
                }
                if(!crown.found){
                    crwn.offset(x: 120, y: 100);
                }
                else{
                    Rectangle().fill(.clear).frame(width:60, height:60);
                }
                let rb = Button{
                    redBerries.located();
                    tog = false;
                    curr_dial = ["You picked up RED BERRIES from the bush."];
                    tog = true;
                    self.refresh();
                } label:{
                    if(!redBerries.found){
                        Image("berrybush").resizable().frame(width:120, height:120).shadow(color: .black, radius: 10);
                        
                    }
                    else{
                        Image("bush").resizable().frame(width:120, height:120);
                    }
                }
                
                Image("bush").resizable().frame(width:120, height:120).offset(x:200,y:80);
                rb.offset(x: 120, y:100);
                
                
            }
            if(tog){
                showDialogueBox(str: curr_dial)
            }
        })
        
    }
    var caves: some View{
        Image("forest").resizable().opacity(0.7).ignoresSafeArea().overlay(
        ZStack{
            HStack{
                let recipe = s.inv.recipe;
                let invoice = s.inv.invoice;
                //gotta make a chest or paper pile image that encompasses the above.
                //big problem here is puzzle.
                //layout: first, a cave. on click, puzzle.
                //second, an open cave. inside, the pile of papers. On click, recieve the documents.
                
                //at this point, "you type in the code.... PYRO"
                
                playerChar().offset(x:-100,y:50);
                let rec = Button{
                    recipe.located();
                    invoice.located();
                    curr_dial = ["The cave unlocks! Inside is a...massive pile of junk.", "There's not much here. You rummage around in hopes of finding something decent.", "All you can find is a RECIPE and an INVOICE"]
                    tog = true;
                    self.refresh();
                    
                } label:{ Rectangle().fill(.red).frame(width:40, height:40)}
                if(!recipe.found){
                    rec.offset(x:100,y:50)
                } else{
                    Rectangle().fill(.clear).frame(width:70, height:70);
                }
            }
            if(tog){
                showDialogueBox(str: curr_dial)
            }
        })
    }
    
    var mountain: some View{
        Image("mountains").resizable().opacity(0.7).ignoresSafeArea().overlay(
        HStack{
            //returnTo = 8;
            //this will be the handler of the statue but the statue is not found here.
            
            //when everything is more fleshed out, when this has a pedestal and the statue is in possesion then it can be placed.

            //On placing, pedestal for statue opens and there's a chest.
            //need pedestal image.
            let chest = s.inv.chest;
            playerChar().offset(x: -150, y: 70);
            
                let base = Button{
                    chest.located();
                    self.refresh();
                    
                } label:{ Image("gray pedestal").resizable().frame(width: 175, height:175).shadow(color: .black, radius: 10)}
            let fin = Button{
                //chest.located();
                self.refresh();
                
            } label:{ Image("statueped").resizable().frame(width: 175, height:175).shadow(color: .black, radius: 10)}
            if(!chest.found){
                base.offset(x:150, y:40);
                
            }
            else{
                fin.offset(x:150, y:40);
            }
            //if statue completed
            //if statue found: on click statue completed. if statue completed,
        })
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
            else if(page==9){
                redRoyal
            }
            else if(page==10){
                //blueRoayl
                redRoyal
            }
            else if(page==11){
                redRoyal
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
