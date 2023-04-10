//
//  foodView.swift
//  foodDiary
//
//  Created by 鄭傳脩 on 2023/4/10.
//

import SwiftUI

struct foodView: View {
    
    let food:food
    var body: some View {
        
        ScrollView {
            VStack{
                Text(food.name)
                Image(food.name)
                    .resizable()
                    .scaledToFit()
                Text(food.intro)
                Image(food.name)
                    .resizable()
                    .scaledToFit()
                Image(food.name)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct foodView_Previews: PreviewProvider {
    static var previews: some View {
        foodView(food: food(name: "蕃茄玉米排骨湯", intro: "清甜爽口又開胃的湯品，簡單三步驟完成，煎排骨、炒蕃茄，加玉米燉煮，煲出好滋味！蕃茄是人人喜愛的蔬菜，富含豐富維生素及茄紅素，平時一定要多吃，有助提高免疫力、抗氧化。"))
    }
}
