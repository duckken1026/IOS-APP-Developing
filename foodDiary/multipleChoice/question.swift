//
//  question.swift
//  foodDiary
//
//  Created by 鄭傳脩 on 2023/4/17.
//

import Foundation

struct Question: Identifiable{
    let id = UUID()
    let question: String
    let choice0: String
    let choice1: String
    let choice2: String
    let choice3: String
    let answer: String
}
