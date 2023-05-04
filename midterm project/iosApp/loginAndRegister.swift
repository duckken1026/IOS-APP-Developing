//
//  loginAndRegister.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import Foundation
import FirebaseAuth

class loginAndRegister{
    
    func registerAccount(){//註冊帳號
        Auth.auth().createUser(withEmail: "peter@neverland.com", password: "123456") { result, error in
                    
            guard let user = result?.user,
                error == nil else {
                print(error?.localizedDescription)
                return
            }
            print(user.email, user.uid)
        }
    }
    
    func loginAccount(){//登入帳號
        Auth.auth().signIn(withEmail: "peter@neverland.com", password: "123456") { result, error in
             guard error == nil else {
                print("error")//輸入錯誤帳號密碼，登入失敗
                return
             }
           print("success")//成功登入
        }
    }
    
}
