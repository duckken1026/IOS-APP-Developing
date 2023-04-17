//
//  multipleChoice.swift
//  foodDiary
//
//  Created by 鄭傳脩 on 2023/4/17.
//

import SwiftUI

struct multipleChoice: View {
    
    let questionState = QuestionState()
    @State private var questionNum:Int = 1//目前為第幾題
    @State private var score:Int = 0//目前分數
    @State private var showAlert = false
    @State private var alertTitle = ""
    
    let question = [Question(question: "「不是人」的星座中，下面哪個星座不再此列？", choice0: "白羊座", choice1: "水瓶座", choice2: "處女座", choice3: "雙魚座", answer: "處女座"),Question(question: "最容易人格分裂的星座是？", choice0: "雙子座", choice1: "巨蟹座", choice2: "水瓶座", choice3: "雙魚座", answer: "雙子座"),
        Question(question: "雙子座被憋死了，死因是：", choice0: "被尿憋死的", choice1: "玩閉氣遊戲，忘記換氣了", choice2: "被自己掐住了脖子", choice3: "不讓說話，無人可聊", answer: "不讓說話，無人可聊"),
        Question(question: "下面哪個星座不是純種物種？", choice0: "白羊座", choice1: "巨蟹座", choice2: "摩羯座", choice3: "雙魚座", answer: "摩羯座"),
        Question(question: "下面哪個星座與水無關？", choice0: "雙魚座", choice1: "天秤座", choice2: "水瓶座", choice3: "巨蟹座", answer: "天秤座")
    ]
    
    var body: some View {
        VStack{
            
            HStack{
                Text("score:" + String(score))
                    .font(.title)
                Spacer()
            }
            .padding()
            
            Text(String(questionNum) + "/5")
                .font(.system(size: 30))
            HStack{
                Text("題目一:" + question[questionNum-1].question)
                    .font(.title)
            }
            .padding()
                
            
            //按鈕
            Button {
                if(question[questionNum-1].choice0 == question[questionNum-1].answer){
                    score = score + 20
                    alertTitle = "答對了正確答案是"+question[questionNum-1].answer
                }
                else{
                    alertTitle = "答錯了正確答案是"+question[questionNum-1].answer
                }
                if(questionNum < 5){
                    questionNum = questionNum + 1
                }
                showAlert = true
                print(question[questionNum-1].choice0,question[questionNum-1].answer)
            } label: {
                Text(question[questionNum-1].choice0)
                .font(.largeTitle)
                .frame(maxWidth: 350)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .alert(alertTitle, isPresented: $showAlert, actions: {
                        Button("OK") { }
            })
            
            Button {
                
                if(question[questionNum-1].choice1 == question[questionNum-1].answer){
                    score = score + 20
                    alertTitle = "答對了正確答案是"+question[questionNum-1].answer
                }
                else{
                    alertTitle = "答錯了正確答案是"+question[questionNum-1].answer
                }
                if(questionNum < 5){
                    questionNum = questionNum + 1
                }
                showAlert = true
            } label: {
                Text(question[questionNum-1].choice1)
                .font(.largeTitle)
                .frame(maxWidth: 350)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .alert(alertTitle, isPresented: $showAlert, actions: {
                        Button("OK") { }
            })
            
            Button {
                
                if(question[questionNum-1].choice2 == question[questionNum-1].answer){
                    score = score + 20
                    alertTitle = "答對了正確答案是"+question[questionNum-1].answer
                }
                else{
                    alertTitle = "答錯了正確答案是"+question[questionNum-1].answer
                }
                if(questionNum < 5){
                    questionNum = questionNum + 1
                }
                showAlert = true
            } label: {
                Text(question[questionNum-1].choice2)
                .font(.largeTitle)
                .frame(maxWidth: 350)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .alert(alertTitle, isPresented: $showAlert, actions: {
                        Button("OK") { }
            })
            
            Button {
                
                if(question[questionNum-1].choice3 == question[questionNum-1].answer){
                    score = score + 20
                    alertTitle = "答對了正確答案是"+question[questionNum-1].answer
                }
                else{
                    alertTitle = "答錯了正確答案是"+question[questionNum-1].answer
                }
                if(questionNum < 5){
                    questionNum = questionNum + 1
                }
                showAlert = true
            } label: {
                Text(question[questionNum-1].choice3)
                .font(.largeTitle)
                .frame(maxWidth: 350)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .alert(alertTitle, isPresented: $showAlert, actions: {
                        Button("OK") { }
            })
           
        }
    }
}

struct multipleChoice_Previews: PreviewProvider {
    static var previews: some View {
        multipleChoice()
    }
}
