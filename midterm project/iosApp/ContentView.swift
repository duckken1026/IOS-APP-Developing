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

    @StateObject var icon = iconManager()
    @State var foodType = "noodles"
    var body: some View {
    
        ZStack{
            Color(red: 249/255, green: 252/255, blue: 254/255)
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Image("barBackground")
                    HStack{
                        Image(icon.noodleIcon)
                            .padding(.top,-20)
                            .onTapGesture {
                                icon.turnBlackIcon(icon: "noodle")
                                print("noodle")
                                foodType = "noodles"
                            }
                        Image(icon.pizzaIcon)
                            .padding(.leading,25)
                            .padding(.top,-15)
                            .onTapGesture {
                                icon.turnBlackIcon(icon: "pizza")
                                print("pizza")
                                foodType = "pizza"
                            }
                        Image(icon.drinkIcon)
                            .padding(.leading,10)
                            .padding(.top,-25)
                            .onTapGesture {
                                icon.turnBlackIcon(icon: "drink")
                                print("drink")
                                foodType = "drinks"
                            }
                        Image(icon.friedFoodIcon)
                            .padding(.leading,10)
                            .padding(.top,-20)
                            .onTapGesture {
                                icon.turnBlackIcon(icon: "friedFood")
                                print("friedFood")
                                foodType = "foods"
                            }
                        Image(icon.iceCreamIcon)
                            .padding(.leading,10)
                            .padding(.top,-20)
                            .onTapGesture {
                                icon.turnBlackIcon(icon: "iceCream")
                                print("iceCream")
                                foodType = "iceCream"
                            }
                    }
                }
                .padding(.bottom,-30)
                Text(icon.getFoodTypeName(icon: foodType))
                    .font(.largeTitle)
                    .padding(.leading,-170)
                foodScrollView(foodType: self.$foodType)
                    .padding(.top,-9)
                
            }
        }
            
            
        
    }
                    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
