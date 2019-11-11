//
//  BottomView.swift
//  TinderApp
//
//  Created by Diego Salazar Arp on 10-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    
    @EnvironmentObject var obs: observer
    
    var body: some View {
        HStack {
            Button(action: {
                
                if self.obs.last != -1{
                    
                    self.obs.updateDB(id: self.obs.users[self.obs.last], status: "")
                }
                
            }) {
                Image("reload").resizable()
                    .frame(width: 30,height: 30)
                    .padding()
            }.foregroundColor(.yellow)
                .background(Color.white)
                .shadow(radius: 25)
                .clipShape(Circle())
            Button(action: {
                
                if self.obs.last == -1{
                    
                    self.obs.updateDB(id: self.obs.users[self.obs.users.count - 1], status: "rejected")
                }
                else {
                     self.obs.updateDB(id: self.obs.users[self.obs.last - 1], status: "rejected")
                }
                
            }) {
                Image("clear").resizable()
                    .frame(width: 35,height: 35)
                    .padding()
            }.foregroundColor(.red)
                .background(Color.white)
                .shadow(radius: 25)
                .clipShape(Circle())
            
            
            Button(action: {
            if self.obs.last == -1{
                    
                    self.obs.updateDB(id: self.obs.users[self.obs.users.count - 1], status: "liked")
                }
                else {
                     self.obs.updateDB(id: self.obs.users[self.obs.last - 1], status: "liked")
                }
            }) {
                Image("heart").resizable()
                    .frame(width: 35,height: 35)
                    .padding()
            }.foregroundColor(.green)
                .background(Color.white)
                .shadow(radius: 25)
                .clipShape(Circle())
            Button(action: {
                
            }) {
                Image("star").resizable()
                    .frame(width: 30,height: 30)
                    .padding()
            }.foregroundColor(.blue)
                .background(Color.white)
                .shadow(radius: 25)
                .clipShape(Circle())
            
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}
