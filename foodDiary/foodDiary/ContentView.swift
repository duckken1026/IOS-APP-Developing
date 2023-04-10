//
//  ContentView.swift
//  foodDiary
//
//  Created by 鄭傳脩 on 2023/4/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            TabView{
                foodPage()
                    .tabItem {
                        Label("食物清單",systemImage: "fork.knife")
                    }
                
                Text("食材訂購")
                    .tabItem {
                        Label("食材訂購",systemImage: "bag")
                }
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
