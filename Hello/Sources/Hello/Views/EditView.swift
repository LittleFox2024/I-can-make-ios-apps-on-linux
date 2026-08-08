import SwiftUI
import UserNotifications
import SQLiteData



struct EditView: View{

    @State private var dogName: String = ""
    @Dependency(\.defaultDatabase) var database
    @AppStorage("lastUUID") var lastUUID: Int = 0
    var body: some View {
        
        TextField("Name", text: $dogName)
            .textFieldStyle(.roundedBorder)
            .padding()

        Button("Add"){
            try? addDog()
        }

    }

    func addDog() throws {
            try database.write { db in
                try Dog.insert { Dog(id: UUID(), name: dogName) }
                .execute(db)
            }   
        }
}