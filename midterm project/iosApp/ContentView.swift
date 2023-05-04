//
//  ContentView.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/1.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


struct ContentView: View {
    @FirestoreQuery(collectionPath: "foods") var Foods: [foods]
    
    var body: some View {
            List {
                ForEach(Foods) { food in
                    HStack {
                        Text(food.name)
                        AsyncImage(url: URL(string:
                            food.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Spacer()
                        VStack(alignment: .trailing) {
                            
                            Text("Price:"+String(food.price))
                            Text("stock:"+"\(food.stock)")

                            
                            }
                            
                        }
                    }
                VStack{
                    Image("topbilloffer")
                        .onTapGesture {
                            print("a")
                    }
                    Image("background")
                }.onTapGesture {
                    print("b")
                }
            }
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
