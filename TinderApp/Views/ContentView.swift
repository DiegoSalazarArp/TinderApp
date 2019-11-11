//
//  ContentView.swift
//  TinderApp
//
//  Created by Diego Salazar Arp on 10-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI
import Firebase


struct ContentView: View {
    
    @EnvironmentObject var obs : observer
    @State var showLikes: Bool = false
    
    var body: some View {
        ZStack {
            Color("Light").edgesIgnoringSafeArea(.all)
            
            if obs.users.isEmpty{
            Loader()
            }
            VStack {
            TopView(show: $showLikes)
            
            SwipeView()
            
            BottomView()
            }
        }.sheet(isPresented: $showLikes) {
            LikedPeople()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
