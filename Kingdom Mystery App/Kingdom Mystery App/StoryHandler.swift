//
//  StoryHandler.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 11/25/22.
//

import Foundation

class Story{
    //this might replace board?
    //or add a board in
    
    //current idea for handling (at least at the moment).
    
    //state boolean keeps track of current story progress
    //this gets passed into the dialogue options part
    //theres an update boolean functions thing in here
    //passes in character id and dialogue option picked
    let b = Board();
    var progress = [Bool]();
    init(){
        for _ in 0...15{
            progress.append(false);
        }
    }
    
    
    func update(char: Char, option: String){
        //time to write down progress for literally the entire story
        var updated = progress;
        //object find first: crown
        if(char.name=="Inn Keeper" && option=="Who Are You?"){
            updated[0] = true;
        }
        if(char.name=="Princess" && option=="Crown"){
            updated[1] = true; //unlocks all throne rooms, other cities. moves princess
        }//object find in here: vault note. Updated[0]
        else if(char.name=="Alchemist" && option=="Who Are You?"){
            updated[2] = true;
            //add in here to give you the potion which you will give to the raccoon. Unlocks potion dialogue.
        } //objects: redberries Updated[3]
        else if(char.name=="Thief" && option=="Potion"){
            updated[4] = true; //give potion, they give you the green berries.
        }
        else if(char.name=="Artist" && option=="Red Berries"){
            //update boolean 1
            updated[5] = true; //change background of town to add red. Need this and next intact to get cave dialogue
        }
        else if(char.name=="Artist" && option=="Green Berries"){
            //update boolean 1
            updated[6] = true; //same as above. both to disguise and get cave dialogue
        }
        else if(char.name=="Blacksmith" && option=="Invoice"){
            updated[7] = true;
            // but to ask it to artist you need redberries and greenberries? or to ask the artist anything
            
        }
        else if(char.name=="Priest" && option=="..."){
            updated[8] = true;
            //gotta make this a dialogue option but i think it's easiest. unlocks priest dialogue for all.
            
        } //updated[9] -> cave reveals invoice and recipe
        else if(char.name=="Baker" && option=="Recipe"){
            updated[10] = true;
            //gives cake item, but im tempted to just unlock the recipe dialogue for the priest.
        }
        else if(char.name=="Priest" && option=="Recipe"){
            updated[11] = true;
            //unlocks statue missing
        }
        else if(char.name=="Thief" && option=="The Missing Statue"){
            updated[12] = true;
            //opens statue sold dialogues, closes statue missing
        }
        else if(char.name=="Alchemist" && option=="The Sold Statue"){
            updated[13] = true;
            //closes statue sold dialogue, somehow opens option interaction for statue placement
        }//object: finding chest after statue thingy updated [14]
        else if(char.name=="Blacksmith" && option=="Chest"){
            updated[14] = true;
            //opens letters dialogue
            //opens option to accuse
        }
        else if(char.name=="Alchemist"&&option=="Letters"){
            updated[15] = true;
        }
        else if(char.name=="Hero"&&option=="Letters"){
            updated[15] = true; //both this and the above lock the letters dialogue.
        }
       
        print(updated);
        progress = updated;
    }
    func options(c:Char)->Array<String>{
        //this is checking boolean progress
        var arr = [String]();
        arr.append("Who Are You?");
        if let d = c.diamond{ if(d.count>0){arr.append("Diamond"); }}
        //conditional: if you find the crown
        if let cr = c.crown{ if(cr.count>0){ arr.append("Crown"); }}
        //conditional: if you find the vault note
        if let v = c.vaultNote{ if(v.count>0){arr.append("Note in the Vault");}}
        if(c.name=="Artist"){
            //conditional: if you have the berries in your possesion
            if let r = c.redBerries{if(r.count>0){arr.append("The Red Berries");}}
        } else{
            //after talking to the penguin
            if let g = c.redBerries{if(g.count>0){arr.append("The Red Berries");}}
        }
        if(c.name=="Artist"){
            //conditional: if you have the berries in your possesion
            if let g = c.greenBerries{if(g.count>0){arr.append("Green Berries");}}
        } else{
            //after talking to the penguin
            if let g = c.greenBerries{if(g.count>0){arr.append("Green Berries");}}
        }
        if(progress[5]&&progress[6]){ //red berries and green berries
            if let d = c.disguising{if(d.count>0){arr.append("Disguising");}}
        }
        if(progress[8]){
            if let p = c.priest{if(p.count>0){arr.append("Priest")}}
        }
        
        //conditional: found the invoice and recipe
        if let i = c.invoice{if(i.count>0){arr.append("Invoice")}}
        if let r = c.recipe{if(r.count>0){arr.append("Recipe")}}
        if(progress[2]) {if let p = c.potion{if(p.count>0){arr.append("Potion")}}}
        
        
        //additional conditional:
        if(progress[11] && !progress[12]) {if let m = c.statueMissing{if(m.count>0){arr.append("The Missing Statue")}}}
        if(progress[12] && !progress[13]) {if let s = c.statueSold{if(s.count>0){arr.append("The Sold Statue")}}}
        if(progress[13]) {if let f = c.statue{if(f.count>0){arr.append("The Found Statue")}}}
        
        
        //chest, letters
        //conditional, got chest
        if let ch = c.chest{if(ch.count>0){arr.append("Chest")}}
        
        if(progress[14] && !progress[15]){
            if let l = c.letters{if(l.count>0){arr.append("Letters")}}
        }
        if(!progress[11]&&c.name=="Priest"){
            arr = ["..."]; //snoozin
        }
        return arr;
    }
    
    func dialogue(str: String, c: Char)-> Array<String>?{
        print(str);
        switch(str){
        case "intro":
            return c.intro;
        case "initial":
            return c.initial;
        case "Who Are You?":
            return c.initial;
        case "Crown":
            //if updated[crown]
            if let cr = c.crown{ return cr; }
        case "Diamond":
            if let d = c.diamond{return d;}
        case "Note in the Vault":
            //if updated[1]
            if let v = c.vaultNote{return v;}
        case "Red Berries":
            //if found the redberries and the person is the artist
            if let r = c.redBerries{return r;}
        case "Green Berries":
                if let g = c.greenBerries{return g;}
        case "Disguising":
            if let d = c.disguising{return d;}
        case "Priest":
            if let p = c.priest{return p;}
        case "Invoice":
            if let i = c.invoice{return i;}
        case "Potion":
            if let p = c.potion{return p;}
        case "Recipe":
            if let r = c.recipe{return r;}
        case "Caves":
            if let ca = c.caves{return ca;}
        case "The Missing Statue":
            if let s = c.statueMissing{return s;}
        case "The Sold Statue":
            if let s = c.statueSold{return s;}
        case "The Found Statue":
            if let s = c.statue{return s;}
        case "Chest":
            if let s = c.chest{return s;}
        case "Letters":
            if let l = c.letters{return l;}
        default:
            var arr = [String]();
            arr.append(" ");
            return arr
        }
        //return nil;
        var arr = [String]();
        arr.append(" ");
        return arr
    }
    
}
