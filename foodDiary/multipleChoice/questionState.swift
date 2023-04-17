//
//  questionState.swift
//  foodDiary
//
//  Created by 鄭傳脩 on 2023/4/17.
//

import Foundation

class QuestionState{
    
    var questionNum:Int = 1//目前為第幾題
    var score:Int = 0//目前分數
    
    func addScore(){//加分
        score = score + 20
    }
    
    func nextQuestion(){//下一題
        questionNum += 1
    }
}


