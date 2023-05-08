//
//  Login.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import SwiftUI

struct Login: View {
    @Binding var currentScreen:String
    @State private var email = ""//email
    @State private var password = ""//密碼
    @State private var showAlert = false
    @State private var alertTitle = ""
    let loginManager = loginAndRegister()
    var body: some View {
        VStack{
            Image("Group 3")
               .padding(-40)
            Image("loginTitle")
                .padding(70)
            Image("E-mail Title")
                .padding(.leading,-160)
                .padding(.top,-8)
            ZStack{
                Image("your name")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的E-mail", text: $email, prompt: Text("你的E-mail"))
                    .padding(.leading,100)
            }
            Image("PasswordTitle2")
                .padding(.leading,-160)
                .padding(.top,30)
            ZStack{
                Image("password")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的密碼", text: $password, prompt: Text("你的密碼"))
                    .padding(.leading,100)
            }
            Image("button")
                .padding(.top,30)
                .onTapGesture {
                    loginManager.logout()
                    var state = ""
                    state = loginManager.loginAccount(email: $email.wrappedValue, password: $password.wrappedValue)
                    if(state == "email-empty"){
                        alertTitle = "請輸入email"
                    }
                    else if(state == "password-empty"){
                        alertTitle = "請輸入密碼"
                    }
                    else if(state == "true"){
                        alertTitle = "登入成功"
                    }
                    else{
                        alertTitle = "登入失敗"
                    }
                    showAlert = true
                    
                }
                .alert(alertTitle, isPresented: $showAlert, actions: {
                    Button("OK") {
                        if(alertTitle == "登入成功"){
                            currentScreen = "Login"} }
                })
            Image("Don’t have an account")
                .padding(.top,20)
                .onTapGesture {
                    currentScreen = "Register"
                }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(currentScreen: .constant("Login"))
    }
}
