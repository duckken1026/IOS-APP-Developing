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
        cards.shuffle()
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
    var negativeFace = ["🍔","🍰","🍥","🍣","🍓","🍮","🍟","🍕"]//背面圖案
    var font = UIFont.systemFont(ofSize: 44)
    lazy var attributes = [NSAttributedString.Key.font: font]
    var emoji = Dictionary<Int,String>()
    
    var flipCount = 0 {//翻牌次數
        didSet{ //property observer 當此變數變化時呼叫
            flipLabel.text = "Flips : " + String(flipCount)
            //updateFlipCountLabel()
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        var countable = true;
        if allCardface != 1{
            if let index = cards.firstIndex(of: sender){
                if(game.isMatched(at: index) == true){
                    countable = false
                }
                else{
                    countable = true
                let card = game.chooseCard(at: index)
                updateCardFace();
                }
            }
            if(countable == true){
                flipCount += 1
            }
            
            //flipLabel.text = "Flips : " + String(flipCount)
            //print(sender.titleLabel!.text!)//取得按鈕上的文字
        }
    }
    
    //重製
    @IBAction func reset(_ sender: Any) {
        
        game.reset()
        updateCardFace()
        allCardface = 0
        flipCount = 0
        cards.shuffle()
    }
    var allCardface = 0//全部卡片要翻的面向0代表目前為反面1代表目前為正面
    
    @IBAction func flipAll(_ sender: Any) {
        if allCardface == 0{//翻反
            game.flipAll()
            updateCardFace()
            allCardface = 1
        }
        else{//翻正
            game.reset()
            updateCardFace()
            allCardface = 0
        }
        cards.shuffle()
        flipCount = 0
    }
    
//    func getEmoji(at index:Int)->String{//取得卡片上的圖案
//        var emoji:String
//        if index < negativeFace.count{
//            emoji = negativeFace[index]
//        }
//        else{
//            emoji = "?"
//        }
//        return emoji
//    }
    
    func getEmoji(for card:Card) -> String{//取得卡片上的圖案
        if emoji[card.identifier] == nil,negativeFace.count>0{
            let randomIndex = Int(arc4random_uniform(UInt32(negativeFace.count)))
            emoji[card.identifier] = negativeFace.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func updateCardFace(){//更新卡片正反面
        for index in cards.indices{
            let button = cards[index]
            let card = game.cards[index]
            
            //判斷現在卡片是正面還是反面
            //翻牌時的判斷(目前為正面)
            //!negativeFace.contains(sender.currentAttributedTitle!.string)
            if card.isFaceUp{
                let message = NSAttributedString(string: getEmoji(for: card), attributes: attributes)
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
            if card.isMatched{//卡片已配對並設定為半透明色
                let frontcolor = #colorLiteral(red: 1, green: 0.3563713431, blue: 0.3826515079, alpha: 0.5)
                button.backgroundColor = frontcolor//type #colorLiteral
            }
        }
    }
}


