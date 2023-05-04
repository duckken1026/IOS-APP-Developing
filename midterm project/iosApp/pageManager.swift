//
//  registerAndLoginManager.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import SwiftUI

struct pageManager: View {
    @State var currentScreen = "Login"//註冊和登入畫面切換
    var body: some View {
        ZStack{
            if currentScreen == "Login" {
                Login(currentScreen: self.$currentScreen)
            }
            else {
                Register(currentScreen: self.$currentScreen)
            }
        }
    }
}

struct pageManager_Previews: PreviewProvider {
    static var previews: some View {
        pageManager()
    }
}
