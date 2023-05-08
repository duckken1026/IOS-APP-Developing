//
//  Register.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import SwiftUI
import FirebaseAuth


struct Register: View {
    @State private var name = ""//姓名
    @State private var email = ""//email
    @State private var password = ""//密碼
    @State private var showAlert = false
    @State private var alertTitle = ""
    @Binding var currentScreen:String
    let registerManager = loginAndRegister()
    var body: some View {
        VStack{
            Image("illustration")
                .padding(-6)
            Image("headText")
                .padding(45)
            Image("Your Name Title")
                .padding(.leading,-160)
            ZStack{
                Image("your name")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的名字", text: $name, prompt: Text("你的名字"))
                    .padding(.leading,200)
            }
            Image("E-MailTitle")
                .padding(.leading,-160)
                .padding(.top,30)
            ZStack{
                Image("e mail")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的e-mail", text: $email, prompt: Text("你的e-mail"))
                    .padding(.leading,200)
            }
            Image("PasswordTitle")
                .padding(.leading,-160)
                .padding(.top,30)
            ZStack{
                Image("password")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的密碼", text: $password, prompt: Text("你的密碼"))
                    .padding(.leading,200)
            }
            Image("registerButton")
                .padding(.top,30)
                .onTapGesture {
                    var state = ""
                    state = registerManager.registerAccount(email: $email.wrappedValue, password: $password.wrappedValue)
                    if(state == "email-empty"){
                        alertTitle = "請輸入email"
                    }
                    else if(state == "password-empty"){
                        alertTitle = "請輸入密碼"
                    }
                    else if(state == "true"){
                        alertTitle = "註冊成功"
                    }
                    else{
                        alertTitle = "註冊失敗"
                    }
                    
                    showAlert = true
                }
                .alert(alertTitle, isPresented: $showAlert, actions: {
                    Button("OK") {
                        if(alertTitle == "註冊成功"){
                            currentScreen = "Login"} }
                })
            Image("Already have an account")
                .padding(.top,5)
                .onTapGesture {
                    currentScreen = "Login"
                }
        }.ignoresSafeArea()
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register(currentScreen: .constant("Register"))
    }
}
