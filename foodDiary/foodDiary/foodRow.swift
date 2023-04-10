//
//  foodRow.swift
//  foodDiary
//
//  Created by 鄭傳脩 on 2023/4/10.
//

import SwiftUI

struct foodRow: View {
    let food:food
    
    var body: some View {
        HStack{
            Image(food.name)
                .resizable()
                .frame(width:150,height:100)
                .clipShape(Circle())
            Text(food.name)
        }
    }
}

struct foodRow_Previews: PreviewProvider {
    static var previews: some View {
        foodRow(food: food(name: "蕃茄玉米排骨湯", intro: "清甜爽口又開胃的湯品，簡單三步驟完成，煎排骨、炒蕃茄，加玉米燉煮，煲出好滋味！蕃茄是人人喜愛的蔬菜，富含豐富維生素及茄紅素，平時一定要多吃，有助提高免疫力、抗氧化。"))
    }
}
