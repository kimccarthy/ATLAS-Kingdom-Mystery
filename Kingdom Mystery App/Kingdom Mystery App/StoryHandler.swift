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
    let inv = Inventory();
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
        if(char.name=="Inn Keeper" && option=="Who Are You?"){
            updated[0] = true;
        }
        if(char.name=="Princess" && option=="Crown"){
            updated[1] = true; //unlocks all throne rooms, other cities. moves princess
            inv.crown.completed = true;
            b.room3.locked = false; //these will change upon throne room
            b.room4.locked = false;
        }
        else if(char.name=="Alchemist" && option=="Who Are You?"){ //Unlocks potion dialogue.
            updated[2] = true;
            inv.potion.located();
        }
        else if(char.name=="Artist" && option=="Who Are You?"){
            updated[3] = true;
        }
        else if(char.name=="Thief" && option=="Potion"){ //give potion, they give you the green berries.
            updated[4] = true;
            inv.potion.completed = true;
            inv.greenBerries.located();
        }
        else if(char.name=="Artist" && option=="Red Berries"){ //Need this and next intact to get cave dialogue
            updated[5] = true;
            inv.redBerries.completed = true;
        }
        else if(char.name=="Artist" && option=="Green Berries"){ //same as above. both to disguise and get cave dialogue
            updated[6] = true;
            inv.greenBerries.completed = true;
        }
        else if(char.name=="Blacksmith" && option=="Invoice"){// but to ask it to artist you need redberries and greenberries? or to ask the artist anything
            updated[7] = true;
            
        }
        else if(char.name=="Priest" && option=="..."){ //gotta make this a dialogue option but i think it's easiest. unlocks priest dialogue for all.
            updated[8] = true;
            
        }
        else if(char.name=="Baker" && option=="Recipe"){ //gives cake item, but im tempted to just unlock the recipe dialogue for the priest. CAKE ITEM
            updated[10] = true;
            
        }
        else if(char.name=="Priest" && option=="Recipe"){ //unlocks statue missing
            updated[11] = true;
            inv.recipe.completed = true;
            //inv.cake.completed = true;
            
        }
        else if(char.name=="Thief" && option=="The Missing Statue"){ //opens statue sold dialogues, closes statue missing
            updated[12] = true;
        }
        
        else if(char.name=="Alchemist" && option=="The Sold Statue"){  //closes statue sold dialogue, somehow opens option interaction for statue placement
            updated[13] = true;
           
        }
        else if(char.name=="Blacksmith" && option=="Chest"){ //opens letters dialogue and option to accuse
            updated[14] = true;
            inv.letters.located();
            
        }
        else if(char.name=="Alchemist"&&option=="Letters"){
            updated[15] = true;
            inv.letters.completed = true;
        }
        else if(char.name=="Hero"&&option=="Letters"){ //both this and the above lock the letters dialogue.
            updated[15] = true;
            inv.letters.completed = true;
        }

        progress = updated;
    }
    func options(c:Char)->Array<String>{ //this is checking boolean AND object progress
        var arr = [String]();
        arr.append("Who Are You?");
        if let d = c.diamond{ if(d.count>0){arr.append("Diamond"); }}
    
        //when you find crown, unlock crown dialogue. Locks on completion
        if(inv.crown.found && !inv.crown.completed){
            if let cr = c.crown{ if(cr.count>0){ arr.append("Crown"); }}
    
        }
        
        //When you find the vault note
        if(inv.note.found){
            if let v = c.vaultNote{ if(v.count>0){arr.append("Note in the Vault");}}
        }
        if(c.name=="Artist"){
            if(inv.redBerries.found && !inv.redBerries.completed){
                if let r = c.redBerries{if(r.count>0){arr.append("The Red Berries");}}
            }
        } else{
            //after talking to the penguin ***NEEDS AN UPDATE SLOT****
            if(progress[3]){
                if let g = c.redBerries{if(g.count>0){arr.append("The Red Berries");}}
                
            }
        }
        if(c.name=="Artist"){
            if(inv.greenBerries.found && !inv.greenBerries.completed){
                if let g = c.greenBerries{if(g.count>0){arr.append("Green Berries");}}
                
            }
        } else{
            //after talking to the penguin
            if(progress[3]){
                if let g = c.greenBerries{if(g.count>0){arr.append("Green Berries");}}
                
            }
        }
        if(progress[5]&&progress[6]){ //red berries and green berries AND NEED AN UPDATE FOR THE EAGLE AND THE INVOICE
            if let d = c.disguising{if(d.count>0){arr.append("Disguising");}}
        }
        if(progress[8]){
            if let p = c.priest{if(p.count>0){arr.append("Priest")}}
        }
        
        //conditional: found the invoice and recipe
        if(inv.invoice.found){
            if let i = c.invoice{if(i.count>0){arr.append("Invoice")}}
        }
        if(inv.recipe.found && !inv.recipe.completed){
            if let r = c.recipe{if(r.count>0){arr.append("Recipe")}}
        }
        
        if(progress[2] && !inv.potion.completed) {if let p = c.potion{if(p.count>0){arr.append("Potion")}}}
        
        //additional conditional:
        if(progress[11] && !progress[12]) {if let m = c.statueMissing{if(m.count>0){arr.append("The Missing Statue")}}}
        if(progress[12] && !progress[13]) {if let s = c.statueSold{if(s.count>0){arr.append("The Sold Statue")}}}
        if(progress[13]) {if let f = c.statue{if(f.count>0){arr.append("The Found Statue")}}}
        
        
        //chest, letters
        //conditional, got chest
        if(inv.chest.found && !inv.chest.completed){
            if let ch = c.chest{if(ch.count>0){arr.append("Chest")}}
            
        }
        
        if(progress[14] && !progress[15]){
            if let l = c.letters{if(l.count>0){arr.append("Letters")}}
        }
        if(!progress[11]&&c.name=="Priest"){
            arr = ["..."]; //snoozin
        }
        return arr;
    }
    
    func dialogue(str: String, c: Char)-> Array<String>?{
        
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
