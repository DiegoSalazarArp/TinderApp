//
//  SwipeView.swift
//  TinderApp
//
//  Created by Diego Salazar Arp on 10-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI


struct SwipeView: View {
    
    @EnvironmentObject var obs : observer
    
    var body: some View {
        
        GeometryReader {
            geo in
            ZStack {
                ForEach(self.obs.users) { i in
                    
                    SwipeDetailsView(name: i.name, age: i.age, image: i.image, height: geo.size.height - 100).gesture(DragGesture()
                        
                        .onChanged({ (value) in
                            if value.translation.width > 0 {
                                self.obs.update(id: i, value: value.translation.width, degrees: 8)
                            }else {
                                self.obs.update(id: i, value: value.translation.width, degrees: -8)
                            }
                            
                            
                        }).onEnded({ (value) in
                            
                            
                            if i.swipe > 0  {
                                if i.swipe > geo.size.width / 2 - 80 {
                                    self.obs.update(id: i, value: 500, degrees: 0)
                                    self.obs.updateDB(id: i, status: "liked")
                                }else{
                                    self.obs.update(id: i, value: 0, degrees: 0)
                                }
                            }else {
                                if -i.swipe > geo.size.width / 2 - 80 {
                                    self.obs.update(id: i, value: -500, degrees: 0)
                                    self.obs.updateDB(id: i, status: "rejected")

                                }else{
                                    self.obs.update(id: i, value: 0, degrees: 0)
                                }
                            }
                            
                        })
                    ).offset(x: i.swipe)
                        .rotationEffect(.init(degrees: i.degree))
                        .animation(.spring())
                    
                }
                
                
            }
        }
        
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
