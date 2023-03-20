//
//  MatchingGame.swift
//  cardGame
//
//  Created by 鄭傳脩 on 2023/3/17.
//

import Foundation

class MatchingGame{
    var cards: Array<Card>

    init(numberOfPairsOfCards: Int){
        cards = []
        for identifier in 1...numberOfPairsOfCards{
            let card = Card(identifier: identifier)
            cards.append(card)
            cards.append(card)//將一對的卡片加入到陣列中
            
        }
        
    }
    
    func chooseCard(at index: Int)->Card{//按下卡片設定卡片的面向
        if cards[index].isFaceUp == true{
            cards[index].isFaceUp = false
        }
        else{
            cards[index].isFaceUp = true
        }
        return cards[index]
    }
}
