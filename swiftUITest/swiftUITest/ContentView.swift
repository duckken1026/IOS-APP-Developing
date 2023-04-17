//
//  ContentView.swift
//  swiftUITest
//
//  Created by 鄭傳脩 on 2023/3/31.
//

import SwiftUI

struct ContentView: View {
    let animals = [
        Animal(name:"Bear",intro: "熊即熊科（學名：Ursidae）動物的通稱，是一種大型哺乳類，屬於食肉目。目前該科共有六屬八種，除非洲(阿特拉斯棕熊已於1870年滅絕)及南極洲與大洋洲無現生野外種群外廣泛分布於北半球和南半球的一部分地區。"),
        Animal(name: "Lion", intro: "獅（學名：Panthera leo）俗稱獅子，是一種產自非洲和亞洲的大型貓科動物，棲息於熱帶草原、半沙漠地帶、較稀疏的旱林與灌木叢等生境。體呈暗黃色，尾端具棕黑色叢毛，成年雄性的脖頸到臉周有黃褐色及黑色長毛環繞，為其顯著特徵。獅子擁有現存貓科中最大的平均體重和僅次於虎的極限體重，一般野生成年雌獅重110–150公斤，雄獅重160–200公斤，最大的雄獅可超過270公斤，圈養下則能達到300公斤以上。"),
        Animal(name: "Penguin", intro: "企鵝屬於企鵝目（學名：Sphenisciformes）企鵝科（Spheniscidae），是一種不會飛的鳥類。     主要生活在南半球，目前已知全世界的企鵝共有19種，另有兩種已滅絕。多數分布在南極地區，而其中環企鵝屬的洪保德環企鵝、麥哲倫環企鵝與斑嘴環企鵝分布在緯度較低的溫帶地區，至於加拉巴哥環企鵝的分布則更接近赤道；完全生活在極地的只有皇帝企鵝及阿德利企鵝兩種。企鵝的身高大約是40到130cm，體重大約1到45kg.企鵝家族中體型最小的是小藍企鵝，最大的是皇帝企鵝。")
    ]
    var body: some View {
        NavigationStack{
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
            .navigationTitle("ContentView")
            
            List{
                ForEach(animals) { index in
                    NavigationLink {
                        animalView(animal: index)
                    } label: {
                        animalRow(animal: index)
                    }
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
