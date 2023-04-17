//
//  buttonView.swift
//  swiftUITest
//
//  Created by 鄭傳脩 on 2023/4/14.
//

import SwiftUI

struct buttonView: View {
    @State private var point = 1//骰子點數
    @State private var diceImageName = "die.face.1.fill"//顯示骰子圖片的名稱
    @State private var value:Double = 1.0//圖片大小
    @State private var showNextPage = false//是否跳到下一頁
    @State private var rotateDegree: Double = 0.0//旋轉角度
    var body: some View {
        
        VStack{
            Image(systemName: diceImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                .scaleEffect(value)
                .rotationEffect(.degrees(rotateDegree))
                .animation(.linear(duration: 1).repeatForever(autoreverses : false), value: rotateDegree)
                .onTapGesture {
                    point = Int.random(in: 1...6)
                    diceImageName = "die.face." + String(point) + ".fill"
                }
            Slider(value: $value,in: 0...1)
            Button("Show"){
                showNextPage = true
            }
            Button("Rotate"){
                rotateDegree = 360
            }
            .font(.title)
        }
        .sheet(isPresented: $showNextPage) {
            let animal = ["Bear","Lion","Penguin"].randomElement()
            sheetView(animal: animal!,showSecondPage: $showNextPage)
        }
    }
}

struct buttonView_Previews: PreviewProvider {
    static var previews: some View {
        buttonView()
    }
}
