//
//  animalView.swift
//  swiftUITest
//
//  Created by 鄭傳脩 on 2023/4/7.
//

import SwiftUI

struct animalView: View {
    
    
    let animal:Animal
    
    var body: some View {
        VStack{
            Image(animal.name)
                .resizable()
                .scaledToFit()
            Text(animal.intro)
        }
    }
}

struct animalView_Previews: PreviewProvider {
    static var previews: some View {
        animalView(animal: Animal(name: "Bear", intro: "熊即熊科（學名：Ursidae）動物的通稱，是一種大型哺乳類，屬於食肉目。目前該科共有六屬八種，除非洲(阿特拉斯棕熊已於1870年滅絕)及南極洲與大洋洲無現生野外種群外廣泛分布於北半球和南半球的一部分地區。"))
    }
}
