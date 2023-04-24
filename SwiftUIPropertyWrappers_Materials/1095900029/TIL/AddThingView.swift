

import SwiftUI

struct AddThingView: View {
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var someThings: ThingStore
  @State private var short = ""
  @State private var long = ""
  @State private var time = ""
  @State private var DateTime = Date()

  private func saveAndExit() {
    if !short.isEmpty {
      someThings.things.append(
        Thing(short: short, long: long))
    }
    presentationMode.wrappedValue.dismiss()
  }

  var body: some View {
      ZStack{
          Color(red: 236/255, green: 201/255, blue: 238/255)
          .ignoresSafeArea()
          VStack {
          Text("新增紀錄")

          TextField("項目：", text: $short)   // 1
            .disableAutocorrection(true)
            .autocapitalization(.allCharacters)   // 2
          TextField(
            "金額：",
            text: $long,
            onEditingChanged: { _ in },
            onCommit: { saveAndExit() }
          )
          .autocapitalization(.words)
          
          Button("加入") {
            saveAndExit()
          }
         
        
          Spacer()
        }
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      }
      
}

struct AddThingView_Previews: PreviewProvider {
  static var previews: some View {
    AddThingView()
      .environmentObject(ThingStore())
  }
}
