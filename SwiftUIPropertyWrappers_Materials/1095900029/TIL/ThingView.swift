

import SwiftUI

struct ThingView: View {
  let thing: Thing
  @State private var showAddThing = false

  var body: some View {
      ZStack{
          Color(red: 255/255, green: 220/255, blue: 182/255)
              .ignoresSafeArea()
          VStack {
            Spacer()
            Text("項目:"+thing.short)
              .font(.largeTitle)
            Text("金額:"+thing.long)
              .font(.largeTitle)
            Spacer()
          }
          .padding()
          .sheet(isPresented: $showAddThing) {
            AddThingView()
          }
          .toolbar {
            ToolbarItem {
              // swiftlint:disable:next multiple_closures_with_trailing_closure
              Button(action: { showAddThing.toggle() }) {
                Image(systemName: "plus.circle")
                  .font(.title)
              }
            }
          }
        }
      }
    
}

struct ThingView_Previews: PreviewProvider {
  static var previews: some View {
    ThingView(
        thing: Thing(short: "1", long: "2"))
  }
}
