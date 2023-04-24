

import SwiftUI

struct ContentView: View {
  @State private var showAddThing = false
  @EnvironmentObject private var myThings: ThingStore
  @State private var itemBackGroundColor = [
    Color(red: 255/255, green: 255/255, blue: 232/255),
    Color(red: 205/255, green: 233/255, blue: 144/255),
    Color(red: 170/255, green: 203/255, blue: 115/255)
 ]

  var body: some View {
      
      NavigationView {
           ZStack{
               Color(red: 255/255, green: 220/255, blue: 182/255)
               .ignoresSafeArea()
               VStack(spacing: 20) {
               if myThings.things.isEmpty {
                 Text("開始記帳吧！")
                   .foregroundColor(.gray)
               }
               ScrollView {
                       ForEach(myThings.things) { thing in   // 1
                           NavigationLink(destination: ThingView(thing: thing)) {
                               Text(thing.short)
                                   .foregroundColor(Color.black)
                                   .fontWeight(.bold)
                                   .font(.title)
                                   .frame(minWidth: 0, maxWidth: .infinity)
                                   .frame(height: 90)
                                   .padding()
                                   .background(itemBackGroundColor[1])
                                   .cornerRadius(40)
                                   .foregroundColor(.white)
                                   .padding(7)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 40)
                                           .stroke(itemBackGroundColor[0], lineWidth: 5)
                                   )
                               
                           }
                           .padding()
                       }
                   }
               Spacer()
             }
             .sheet(isPresented: $showAddThing) {
               AddThingView()
             }
             .navigationTitle("記帳小幫手")
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
           .navigationViewStyle(StackNavigationViewStyle())
           }
            
      }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ThingStore())
  }
}
