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
    
    var flipCount = 0 //翻牌次數
    @IBAction func touchCard(_ sender: UIButton) {
        
        var title = ""
        let positveFace = ["😀","😄"]//正面圖案
        let negativeFace = ["1","2"]//背面圖案
        
        if let tit = sender.titleLabel!.text{
            title = tit
        }

        if(sender.currentTitle == nil){
            sender.setTitle(title, for: UIControl.State.normal)
        }
        
        //判斷現在卡片是正面還是反面
        //翻牌時的判斷
        if let cardIndex = positveFace.firstIndex(of: title){
            sender.setTitle(negativeFace[cardIndex], for: UIControl.State.normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.3563713431, blue: 0.3826515079, alpha: 1) //type #colorLiteral
        }
        //翻牌時的判斷
        if let cardIndex = negativeFace.firstIndex(of: title){
            sender.setTitle(positveFace[cardIndex], for: UIControl.State.normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.7065654397, blue: 0.1603511274, alpha: 1) //type #colorLiteral
        }

        flipCount += 1
        flipLabel.text = "Flips : " + String(flipCount)
        //print(sender.titleLabel!.text!)//取得按鈕上的文字
    }
    
}

