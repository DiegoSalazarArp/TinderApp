//
//  Data.swift
//  TinderApp
//
//  Created by Diego Salazar Arp on 10-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import UIKit
import Combine


struct Datatype: Identifiable {
    var id: String
    var name: String
    var age: String
    var image: String
    var swipe: CGFloat
    var degree: Double
}

class observer1: ObservableObject{
    @Published var data = [Datatype1]()
    
    init(){
        let db = Firestore.firestore()
        
        db.collection("liked").getDocuments { (snap, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }else{
                for i in snap!.documents {
                    
                    let name = i.get("name") as! String
                    let age = i.get("age") as! String
                    let image = i.get("image") as! String

                    self.data.append(Datatype1(name: name, age: age, image: image, id: UUID().uuidString))
                    
                }
            }
            
        }
    }
}

struct Datatype1: Identifiable {
    
    var name: String
    var age: String
    var image: String
    var id: String
}



class observer : ObservableObject {
    
    @Published var users = [Datatype]()
    @Published var last = -1
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { (snap, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents {
                
                let name = i.get("name") as! String
                let age = i.get("age") as! String
                let image = i.get("image") as! String
                let id = i.documentID
                let status = i.get("status") as! String
                
                
                
                if status != "rejected"{
                    self.users.append(Datatype(id: id, name: name, age: age, image: image, swipe: 0, degree: 0))
                }}
            
        }
    }
    func update(id: Datatype,value: CGFloat, degrees : Double) {
        
        for i in 0..<self.users.count {
            
            if self.users[i].id == id.id {
                self.users[i].swipe = value
                self.users[i].degree = degrees
                self.last = i
            }
        }
        
    }
    
    
    func updateDB(id: Datatype, status: String){
        let db = Firestore.firestore()
        db.collection("users").document(id.id).updateData(["status":status]) { (err) in
            
            if err != nil {
                print(err)
                return
            }
            print("Success")
            
            for i in 0..<self.users.count {
                
                if self.users[i].id == id.id {
                    if status == "liked" {
                        self.users[i].swipe = 500
                    }
                    else if status ==  "rejected"{
                        self.users[i].swipe = -500
                    }
                    else {
                         self.users[i].swipe = 0
                    }
                }
            }
            
            if status == "liked" {
                db.collection("liked").document().setData(["name":id.name,"age":id.age,"image":id.image]) {(err) in
                    
                    if err != nil {
                        print((err?.localizedDescription)!)
                        return
                    }
                }
            }
            if status == "" {
                db.collection("liked").document().delete() {
                    (err) in
                    
                    if err != nil {
                        print((err?.localizedDescription)!)
                        return
                        
                    }
                }
            }
            
        }
        
    }
}
