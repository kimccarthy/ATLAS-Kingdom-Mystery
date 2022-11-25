//
//  Parsing.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/10/22.
//
import Foundation

struct Char: Codable{
    var name: String
    var img: String
    var img2: String?
    var intro: Array<String>
    var initial: Array<String>
    var crown:Array<String>?
    var diamond: Array<String>?
    var vaultNote: Array<String>?
    var redBerries: Array<String>?
    var greenBerries: Array<String>?
    var disguising: Array<String>?
    var priest: Array<String>?
    var invoice: Array<String>?
    var potion: Array<String>?
    var recipe: Array<String>?
    var caves: Array<String>?
    var statueMissing: Array<String>?
    var statueSold: Array<String>?
    var statue: Array<String>?
    var chest: Array<String>?
    var letters:Array<String>?
    
    static var chars: [Char?]? {
        
        var cs = [Char.fromJSONFile(named: "beaver")] //0
        cs.append(Char.fromJSONFile(named: "elephant")) //1
        cs.append(Char.fromJSONFile(named: "hero")) //2
        cs.append(Char.fromJSONFile(named: "baker")) //3
        cs.append(Char.fromJSONFile(named: "princess")) //4
        cs.append(Char.fromJSONFile(named: "blacksmith")) //5
        cs.append(Char.fromJSONFile(named: "priest")) //6
        cs.append(Char.fromJSONFile(named: "artist")) //7
        cs.append(Char.fromJSONFile(named: "thief")) //8
        return cs
    }

       static func fromJSON(data: Data) -> Char? {
           let decoder = JSONDecoder()
           do {
               let chars = try decoder.decode(Char.self, from: data)
               return chars
           } catch {
               print("Could not make people from data.", error.localizedDescription)
               return nil
           }
       }

       static func fromJSONFile(named name: String) -> Char? {
           if let data = Data.fromJSONFile(forName: name) {
               print("Trying: \(name)")
               return fromJSON(data: data)
           }
           print(name)
           return nil
       }
    
    func dialogue(str: String)-> Array<String>?{
        //let arr:Array<String> ;
        switch(str){
        case "intro":
            return intro;
        case "initial":
            return initial;
        case "crown":
            if let c = crown{
                return c;
            }
        case "diamond":
            if let d = diamond{return d;}
        case "vaultNote":
            if let v = vaultNote{return v;}
        case "redberries":
            if let r = redBerries{return r;}
        case "greenBerries":
            if let g = greenBerries{return g;}
        case "disguising":
            if let d = disguising{return d;}
        case "priest":
            if let p = priest{return p;}
        case "invoice":
            if let i = invoice{return i;}
        case "potion":
            if let p = potion{return p;}
        case "recipe":
            if let r = recipe{return r;}
        case "caves":
            if let c = caves{return c;}
        default:
            var arr = [String]();
            arr.append(" ");
            return arr
        
                
                /*var diamond: Array<String>?
                 var vaultNote: Array<String>?
                 var redBerries: Array<String>?
                 var greenBerries: Array<String>?
                 var disguising: Array<String>?
                 var priest: Array<String>?
                 var invoice: Array<String>?
                 var potion: Array<String>?
                 var recipe: Array<String>?
                 var caves: Array<String>?
                 var statueMissing: Array<String>?
                 var statueSold: Array<String>?
                 var statue: Array<String>?
                 var chest: Array<String>?
                 var letters:Array<String>?*/
       // default: return nil;
        }
        //return nil;
        var arr = [String]();
        arr.append(" ");
        return arr
    }
    
    func getOptions() -> Array<String>{
        
        //this will also include booleans in a second
        
        var str = [String]();
        if(crown!.count>0){ str.append("Crown") }
        if(diamond!.count>0){str.append("Diamond")}
        if(vaultNote!.count>0){str.append("Note in the Vault")}
        if(redBerries!.count>0){str.append("Red Berries")}
        if(greenBerries!.count>0){str.append("Green Berries")}
        if(disguising!.count>0){str.append("Disguises")}
        if(priest!.count>0){str.append("The Priest")}
        if(invoice!.count>0){str.append("Invoice")}
        if(potion!.count>0){str.append("Potion")}
        if(recipe!.count>0){str.append("Recipe")}
        if(caves!.count>0){str.append("Caves")}
        if(statueMissing!.count>0){str.append("Missing Statue")}
        if(statueSold!.count>0){str.append("Sold Statue")}
        if(statue!.count>0){str.append("Statue")}
        if(chest!.count>0){str.append("Chest")}
        if(letters!.count>0){str.append("Letters")}
        return str;
        
        
    }
    
}
