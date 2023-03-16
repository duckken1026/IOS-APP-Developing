//
//  ViewController.swift
//  cardGame
//
//  Created by 鄭傳脩 on 2023/3/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    
    var flipCount = 0 {//翻牌次數
        didSet{ //property observer 當此變數變化時呼叫
            flipLabel.text = "Flips : " + String(flipCount)
            //updateFlipCountLabel()
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        var title = ""
        let font = UIFont.systemFont(ofSize: 44)
        let attributes = [NSAttributedString.Key.font: font]
        let cardID = cards.firstIndex(of: sender)
        
        let positveFace = [""]//正面圖案
        let negativeFace = ["🍔","🍰","🍥","🍣","🍥","🍰","🍔","🍣"]//背面圖案
        
        if let tit = sender.titleLabel!.text{
            title = tit
        }
        
        
        if(sender.currentAttributedTitle == nil){
            let message = NSAttributedString(string: title, attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
        }
        
        
        
        //判斷現在卡片是正面還是反面
        //翻牌時的判斷(目前為正面)
        if !negativeFace.contains(sender.currentAttributedTitle!.string){
            
            let message = NSAttributedString(string: negativeFace[cardID!], attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
            let frontcolor = #colorLiteral(red: 1, green: 0.3563713431, blue: 0.3826515079, alpha: 1)
            sender.backgroundColor = frontcolor//type #colorLiteral
        }
        //翻牌時的判斷(目前為反面)
        else{
            let message = NSAttributedString(string: "", attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
            let bgcolor = #colorLiteral(red: 1, green: 0.7065654397, blue: 0.1603511274, alpha: 1)
            sender.backgroundColor = bgcolor //type #colorLiteral
        }

        
        flipCount += 1
        //flipLabel.text = "Flips : " + String(flipCount)
        //print(sender.titleLabel!.text!)//取得按鈕上的文字
        
    }
    
}

