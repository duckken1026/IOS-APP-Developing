//
//  ContentView.swift
//  InstagramUI
//
//  Created by 鄭傳脩 on 2023/4/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(){
            
            HStack()//名字及返回
            {
                Image("returnArrow")
                    .resizable()
                    .frame(width:50,height: 60)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                Text("zhengchuanxiu")
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 10))
                Spacer()
                Image("returnArrow")
                    .resizable()
                    .frame(width:50,height: 60)
            }
            .padding(EdgeInsets(top: -10, leading: 10, bottom: 0, trailing: 10))
            
            HStack(){//大頭貼與追蹤資訊
                Image("headerIcon")
                    .resizable()
                    .frame(width:100,height:100)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.black, lineWidth: 0.08)
                    }
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                Spacer()
                VStack{
                   Text("27")
                        .font(.title2)
                   Text("貼文")
                        .font(.system(size: 18, weight: .light, design: .default))
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Spacer()
                VStack{
                   Text("888")
                    .font(.title2)
                   Text("粉絲")
                    .font(.system(size: 18, weight: .light, design: .default))
                }
                Spacer()
                VStack{
                   Text("45")
                    .font(.title2)
                   Text("追蹤中")
                    .font(.system(size: 18, weight: .light, design: .default))
                }
                Spacer()
            }
            
            HStack(){
                VStack(alignment: .leading,spacing: 7){
                    Text("鄭傳脩")
                        .font(.title3)
                    Text("Scorpio♏️")
                    Text("NTUT CS")
                }
                Spacer()
            }
            .padding(EdgeInsets(top: -5, leading: 25, bottom: 0, trailing: 0))
            
            
            Text("c")
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
