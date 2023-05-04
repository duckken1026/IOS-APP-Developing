

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@main
struct DemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           pageManager()
        }
    }
}
