//
//  Inventory.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 11/25/22.
//

import Foundation

class Object{
    var img: String;
    var silhouette: String;
    var name: String;
    var found: Bool;
    init(i:String, s: String, n:String){
        img = i;
        name = n;
        silhouette = s;
        found = false;
    }
    func located(){
        found = true;
    }
    func lost(){
        found = false;
    }
    //we can overload the update function hopefully

}
