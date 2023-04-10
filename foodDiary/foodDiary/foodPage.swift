//
//  foodPage.swift
//  foodDiary
//
//  Created by 鄭傳脩 on 2023/4/10.
//

import SwiftUI

struct foodPage: View {
    let foods = [food(name: "蕃茄玉米排骨湯", intro: "清甜爽口又開胃的湯品，簡單三步驟完成，煎排骨、炒蕃茄，加玉米燉煮，煲出好滋味！蕃茄是人人喜愛的蔬菜，富含豐富維生素及茄紅素，平時一定要多吃，有助提高免疫力、抗氧化。"),
        food(name: "家常麻油蔥香雞腿肉", intro: "嫩嫩的雞腿肉以麻油和蔥段帶出濃郁香氣，醬油融合糖的鹹甜滋味，淋上熱騰騰的白飯，大人小孩都喜歡喔！"),
        food(name: "全素蛋糕（宇治金時磅蛋糕)", intro: "這款蛋糕可以說是全素者的福音，因為全素者不能吃蛋跟奶，奶在烘焙的作用不大，但是蛋是很重要的角色，蛋在烘焙的作用有蓬鬆、凝固、乳化等作用，而蛋的特性難以取代，所以這個食譜是經過精心設計的這個食譜算蠻特別的，他有抹茶，巧克力跟紅豆，口感有點像布朗尼，這個食譜會教自製紅豆沙的方法，泡打粉和小蘇打粉不能省略，因為已經沒有蛋了，如果省略他，蛋糕就不會膨脹起來。")
    ]
    
    var body: some View {
        NavigationView(){
            VStack{
                List{
                    ForEach(foods) { index in
                        NavigationLink {
                            foodView(food: index)
                        } label: {
                            foodRow(food: index)
                        }
                    }
                }
            }
            //.padding()
            .navigationTitle("食物清單")
        }
        
        
    }
}

struct foodPage_Previews: PreviewProvider {
    static var previews: some View {
        foodPage()
    }
}
