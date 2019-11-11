//
//  LikedPeople.swift
//  TinderApp
//
//  Created by Diego Salazar Arp on 11-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct LikedPeople: View {
    
    @ObservedObject var datas = observer1()
    
    var body: some View {
        
        VStack {
            if datas.data.isEmpty {
                Text("No liked people")
            }else{
                List(datas.data) {
                    i in
                    Cards(name: i.name, image: i.image)
                }
            }
        }
        

    }
}


struct Cards: View {
    var name = ""
    var image = ""
    var body : some View {
        HStack {
            AnimatedImage(url: URL(string: image)!).resizable()
                .frame(width: 65, height: 65)
            .clipShape(Circle())
            
            Text(name).fontWeight(.heavy)
        }
    }
    
}


struct LikedPeople_Previews: PreviewProvider {
    static var previews: some View {
        LikedPeople()
    }
}
