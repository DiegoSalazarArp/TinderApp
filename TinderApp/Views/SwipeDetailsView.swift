//
//  SwipeDetailsView.swift
//  TinderApp
//
//  Created by Diego Salazar Arp on 10-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import UIKit


struct SwipeDetailsView: View {
    
    var name = ""
    var age = ""
    var image = ""
    var height : CGFloat = 0
    
    var body: some View {

        ZStack {
            
            AnimatedImage(url: URL(string: image)!).resizable()
            .cornerRadius(20)
            .padding(.horizontal, 15)
            
            VStack {
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, content:  {
                        
                        Text(name).font(.system(size: 25)).fontWeight(.heavy).foregroundColor(.white)
                        Text(age).foregroundColor(.white)
                    })
                    Spacer()
                }
            }.padding([.bottom, .leading], 35)
            
        }.frame(height: height)

    }
}

struct SwipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetailsView()
    }
}
