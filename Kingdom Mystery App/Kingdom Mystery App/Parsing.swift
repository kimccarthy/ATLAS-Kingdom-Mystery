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
               //print("Trying: \(name)")
               return fromJSON(data: data)
           }
           //print(name)
           return nil
       }
    
    func dialogue(str: String)-> Array<String>?{
        //let arr:Array<String> ;
        switch(str){
        case "...":
            return ["..."];
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
        
        }
        var arr = [String]();
        arr.append(" ");
        return arr
    }

}


class Monarch{
    var img: String;
    var id: Int;
    var dial: Array<String>;
    var acc: Array<String>?;
    var idle: Array<String>;
    init(i: String, d: Int, dl: Array<String>, idl: Array<String>){
        img = i;
        id = 0;
        dial = dl;
        idle = idl;
        if(id==0){
            acc = ["You choose to accuse? Think carefully, this cannot be undone.", "Would you like to proceed?"];
        }
        else{acc = nil; }
    }
}
