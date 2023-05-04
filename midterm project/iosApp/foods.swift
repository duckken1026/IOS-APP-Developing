

import FirebaseFirestoreSwift

struct foods: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let price: Int
    let stock: Int
    let image: String
}
