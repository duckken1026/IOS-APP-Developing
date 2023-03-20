//
//  Card.swift
//  cardGame
//
//  Created by 鄭傳脩 on 2023/3/17.
//

import Foundation

struct Card{
    var isFaceUp = false;//是否被翻開
    var isMatched = false;//這張牌是不是已經配對了
    var identifier:Int//記錄卡片的ID
    
    init(identifier i:Int){
        identifier = i
    }
}
