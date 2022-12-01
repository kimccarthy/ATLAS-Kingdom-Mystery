//
//  Inventory.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 11/25/22.
//
import SwiftUI
import Foundation

class Object{
    var img: String;
    var silhouette: String;
    var name: String;
    var found: Bool;
    var completed: Bool;
    init(i:String, s: String, n:String){
        img = i;
        name = n;
        silhouette = s;
        found = false;
        completed = false;
    }
    func located(){
        found = true;
    }
    func lost(){
        found = false;
    }
    //we can overload the update function hopefully

}


class Inventory{
    var crown = Object(i: "crown", s: "crown_sil", n: "Crown of Lochan");
    var note = Object(i: "note", s: "note_sil", n: "Note in the Vault");
    var redBerries = Object(i: "rb", s: "rb_sil", n: "Red Berries");
    var greenBerries = Object(i: "gb", s: "gb_sil", n: "Green Berries");
    var invoice = Object(i: "invoice", s: "invoice_sil", n: "Invoice");
    var recipe = Object(i: "recipe", s: "recipe_sil", n: "Recipe for Caramel Cake");
    var potion = Object(i: "potion", s: "potion_sil", n: "Potion");
    var statue = Object(i: "statue", s: "statue_sil", n: "Statue of Sliavh");
    var chest = Object(i: "chest", s: "chest_sil", n:"Mysterious Chest");
    var letters = Object(i: "letters", s: "letters_sil", n: "Letters");
    var cake = Object(i: "cake", s: "cake_sil", n:"Caramel Cake Crisp");
    var diamond = Object(i: "diamond", s: "diamond_sil", n: "The Diamond of Lochan");
    var obs: Array<Object>;
    init(){
        obs = [crown, note, potion, redBerries, greenBerries, recipe, invoice, cake, statue, chest, letters, diamond];
    }
    
    func objColor(obj: Object)->Color{ //this will be image in a sec
        if(obj.found && !obj.completed){return .gray}
        else if(!obj.found){return .red}
        else if(obj.found && obj.completed){return .green}
        else{return .blue}//should never hit
    }
    
    //cmon you can do better than this.
    func display(c: ContentView, ret: Int)-> some View{
        VStack{
            HStack{
                ForEach(0..<3){i in
                    let obj = self.obs[i];
                    Rectangle().fill(self.objColor(obj:obj)).frame(width: 50, height: 50);
                }
            }
            HStack{
                ForEach(3..<6){i in
                    let obj = self.obs[i];
                    Rectangle().fill(self.objColor(obj:obj)).frame(width: 50, height: 50);
                }
            }
            HStack{
                ForEach(6..<9){i in
                    let obj = self.obs[i];
                    Rectangle().fill(self.objColor(obj:obj)).frame(width: 50, height: 50);
                }
            }
            HStack{
                ForEach(9..<12){i in
                    let obj = self.obs[i];
                    Rectangle().fill(self.objColor(obj:obj)).frame(width: 50, height: 50);
                }
            }
            Button("< Back"){
                c.page = ret;
            }
        }
        
    }
    
    func zoomView(obj: Object, c: ContentView)-> some View{
        VStack{
            Rectangle().fill(objColor(obj: obj)).frame(width:200, height:200);
            Button("< Back"){
                c.page = 5;
            }
        }
    }
    
}
