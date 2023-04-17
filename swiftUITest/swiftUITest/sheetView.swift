//
//  sheetView.swift
//  swiftUITest
//
//  Created by 鄭傳脩 on 2023/4/14.
//

import SwiftUI

struct sheetView: View {
    let animal:String
    @Binding var showSecondPage:Bool
    var body: some View {
        VStack{
            Image(animal)
                .resizable()
                .scaledToFit()
            Button("Close"){
                showSecondPage = false
            }
        }
    }
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        sheetView(animal: "Bear", showSecondPage : .constant(true))
    }
}
