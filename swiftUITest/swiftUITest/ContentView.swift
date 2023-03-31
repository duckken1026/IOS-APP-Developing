//
//  ContentView.swift
//  swiftUITest
//
//  Created by 鄭傳脩 on 2023/3/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Hello, world!")
                    .font(.title)
                    .padding()
                    .background(.green)
                    .cornerRadius(10.0)
                    .rotation3DEffect(Angle(degrees: 20), axis: (x: 55.0, y: 50.0, z: 0.0))
                    .shadow(radius:CGFloat(1),
                            x: CGFloat(-10),y:CGFloat(10))
                Text("Duck")
                    .font(.title)
                    .padding()
                    .background(.yellow)
                    .cornerRadius(10.0)
                    .rotation3DEffect(Angle(degrees: -20), axis: (x: -55.0, y: 50.0, z: 0.0))
                    .shadow(radius:CGFloat(1),
                            x: CGFloat(10),y:CGFloat(10))
            }
            ZStack{
                Image("duck")
                    
                Text("#")
                    .offset(x:70,y:60)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
