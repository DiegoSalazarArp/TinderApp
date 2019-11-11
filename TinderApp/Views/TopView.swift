//
//  TopView.swift
//  TinderApp
//
//  Created by Diego Salazar Arp on 10-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI
import SDWebImage

struct TopView: View {
    @Binding var show : Bool
    
    var body: some View {
       HStack {
            Button(action: {
                
            }) {
                Image("person").resizable()
                    .frame(width: 35, height:35)
                
            }.foregroundColor(.gray)
        Spacer()
        Button(action: {
            
        }) {
            Image(systemName: "flame.fill").resizable()
                .frame(width: 30, height:35)
            
        }.foregroundColor(.red)
        Spacer()
        Button(action: {
            self.show.toggle()
        }) {
            Image("chat").resizable()
                .frame(width: 35, height:35)
            
        }.foregroundColor(.gray)
        }.padding()
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(show: .constant(false))
    }
}
