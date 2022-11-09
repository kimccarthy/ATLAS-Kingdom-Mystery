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
}
