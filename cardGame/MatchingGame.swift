//
//  MatchingGame.swift
//  cardGame
//
//  Created by 鄭傳脩 on 2023/3/17.
//

import Foundation

class MatchingGame{
    var cards: Array<Card>
    var indexOfOneAndOnlyFaceUpCard: Int?//記錄前一次點擊已翻開的牌
    
    init(numberOfPairsOfCards: Int){
        cards = []
        for identifier in 1...numberOfPairsOfCards{
            let card = Card(identifier: identifier)
            cards.append(card)
            cards.append(card)//將一對的卡片加入到陣列中
            
        }
        
    }
    
    func chooseCard(at index: Int)->Card{//按下卡片設定卡片的面向
//        if cards[index].isFaceUp == true{
//            cards[index].isFaceUp = false
//        }
//        else{
//            cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMatched{//配對成功按下去就不會有反應
            //若已經有已翻開的牌
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            //點在已翻開的唯一牌上會翻回去
            else if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex == index{
                cards[index].isFaceUp = false
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else { //no cards face up or 2 cards are face up
                for flipDownIndex in cards.indices{
                    if !cards[flipDownIndex].isMatched{ //想要維持在正面
                        cards[flipDownIndex].isFaceUp = false
                    }
                } // all cards set back to face down
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        return cards[index]
    }
    
    func reset(){//重置
        for i in cards.indices{
            cards[i].isFaceUp = false
            cards[i].isMatched = false
        }
    }
}
