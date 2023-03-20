//
//  ViewController.swift
//  cardGame
//
//  Created by 鄭傳脩 on 2023/3/10.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingGame.init(numberOfPairsOfCards: (cards.count+1)/2);//直到按鈕初始化完成才會設定此變數
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional seup after loading the view.
        updateFlipCountLabel()
    }
    
    //更改翻面次數字型
    private func updateFlipCountLabel(){
        let flipAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 40),
            .strokeColor : UIColor.darkGray,
            .strokeWidth : -3.0,
            .foregroundColor:UIColor.darkGray]
        let attribtext = NSAttributedString(string: "Flips : 0",  attributes: flipAttributes)
        flipLabel.attributedText = attribtext
    }
    
    
    @IBOutlet weak var flipLabel: UILabel!
    
    @IBOutlet var cards: [UIButton]!
    let positveFace = [""]//正面圖案
    let negativeFace = ["🍔","🍰","🍥","🍣","🍥","🍰","🍔","🍣"]//背面圖案
    var font = UIFont.systemFont(ofSize: 44)
    lazy var attributes = [NSAttributedString.Key.font: font]
    
    var flipCount = 0 {//翻牌次數
        didSet{ //property observer 當此變數變化時呼叫
            flipLabel.text = "Flips : " + String(flipCount)
            //updateFlipCountLabel()
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let index = cards.firstIndex(of: sender){
            let card = game.chooseCard(at: index)
            flipCard();
        }
        
        flipCount += 1
        //flipLabel.text = "Flips : " + String(flipCount)
        //print(sender.titleLabel!.text!)//取得按鈕上的文字
        
    }
    
    func getEmoji(at index:Int)->String{//取得卡片上的圖案
        var emoji:String
        if index < negativeFace.count{
            emoji = negativeFace[index]
        }
        else{
            emoji = "?"
        }
        return emoji
    }
    
    func flipCard(){//卡片翻面
        for index in cards.indices{
            let button = cards[index]
            let card = game.cards[index]
            //判斷現在卡片是正面還是反面
            //翻牌時的判斷(目前為正面)
            //!negativeFace.contains(sender.currentAttributedTitle!.string)
            if card.isFaceUp{
                let message = NSAttributedString(string: getEmoji(at: index), attributes: attributes)
                button.setAttributedTitle(message, for: UIControl.State.normal)
                let frontcolor = #colorLiteral(red: 1, green: 0.3563713431, blue: 0.3826515079, alpha: 1)
                button.backgroundColor = frontcolor//type #colorLiteral
            }
            //翻牌時的判斷(目前為反面)
            else{
                let message = NSAttributedString(string: "", attributes: attributes)
                button.setAttributedTitle(message, for: UIControl.State.normal)
                let bgcolor = #colorLiteral(red: 1, green: 0.7065654397, blue: 0.1603511274, alpha: 1)
                button.backgroundColor = bgcolor //type #colorLiteral
                
            }
        }
    }
}


