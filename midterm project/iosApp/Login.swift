//
//  Login.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import SwiftUI

struct Login: View {
    @Binding var currentScreen:String
    @State private var name = ""
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
                TextField("你的名字", text: $name, prompt: Text("你的E-mail"))
                    .padding(.leading,100)
            }
            Image("PasswordTitle2")
                .padding(.leading,-160)
                .padding(.top,30)
            ZStack{
                Image("password")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的名字", text: $name, prompt: Text("你的密碼"))
                    .padding(.leading,100)
            }
            Image("button")
                .padding(.top,30)
                .onTapGesture {
                    loginManager.loginAccount()
                }
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
