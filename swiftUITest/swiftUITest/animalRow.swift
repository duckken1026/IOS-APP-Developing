//
//  animalRow.swift
//  swiftUITest
//
//  Created by 鄭傳脩 on 2023/4/7.
//

import SwiftUI

struct animalRow: View {
    
    let animal:Animal
    
    var body: some View {
        HStack{
            Image(animal.name)
                .resizable()
                .frame(width:150,height:100)
                .clipShape(Circle())
            Text(animal.name)
        }
    }
}

struct animalRow_Previews: PreviewProvider {
    static var previews: some View {
        animalRow(animal: Animal(name: "Bear", intro: "Bear"))
    }
}
