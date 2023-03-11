//
//  ViewController.swift
//  BMI
//
//  Created by 鄭傳脩 on 2023/3/6.
//

import UIKit

var gender : String? = "Male"//性別
var bmi : Float? = 0.0//計算出的BMI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var selectedGender: UISegmentedControl!//性別選擇元件
    @IBOutlet weak var Height: UITextField!//身高
    @IBOutlet weak var Weight: UITextField!//體重
    @IBOutlet weak var status: UILabel!//評語
    
    func getMaleStatus(BMI : Float) -> String {//取得男性的身體狀況
        if(BMI >= 30.0){
            return "Obesity"
        }
        else if(BMI >= 25.0){
            return "Overweight"
        }
        else if(BMI >= 18.5){
            return "Healthy weight"
        }
        else if(BMI < 18.5){
            return "Underweight"
        }
        else{
            return "Error"
        }
    }
    
    func getFemaleStatus(BMI : Float) -> String {//取得女性的身體狀況
        if(BMI >= 25.0){
            return "it’s a secret"
        }
        else if(BMI >= 18.5){
            return "Healthy weight"
        }
        else if(BMI < 18.5){
            return "Underweight"
        }
        else{
            return "Error"
        }
    }
    
    @IBAction func selectGender(_ sender: Any) {//當改變性別時觸發
        if(selectedGender.selectedSegmentIndex == 0){//選中男性
            gender = "Male"
        }
        else{//選中女性
            gender = "Female"
        }
    }
    
    @IBOutlet weak var result: UILabel!
    @IBAction func calculateBMI(_ sender: Any) {
        var h = Float(Height.text!)!
        var w = Float(Weight.text!)!
        h = h/100;
        h = h*h;
        bmi = w/h;
        result.text = String(bmi!);//顯示BMI結果
        
        if((gender!) == "Male"){
            status.text = getMaleStatus(BMI: bmi!)//顯示身體狀態
        }
        else{
            status.text = getFemaleStatus(BMI: bmi!)//顯示身體狀態
        }
    }
    
    
}

