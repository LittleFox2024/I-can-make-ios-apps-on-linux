import Foundation
import SwiftUI
import SQLiteData

struct CreateTimeView: View {
    @Dependency(\.defaultDatabase) var database
    @State private var time: String = ""
    @State private var selectedDogId: UUID?
    @FetchAll(Dog.order(by: \.name)) private var dogs

    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Time")) {
                    TextField("Enter time", text: $time)
                        .keyboardType(.numbersAndPunctuation)
                }
                
                Section(header: Text("Select Dog")) {
                    Picker("Dog", selection: $selectedDogId) {
                        ForEach(dogs) { dog in
                            Text(dog.name).tag(dog.id as UUID?)
                        }
                    }
                }
                
                Button("Save") {
                    withErrorReporting {
                        try database.write { db in
                            let newTime = Time(id: UUID(), time: time, dogId: selectedDogId!)
                            try Time.insert(newTime).execute(db)
                        }
                    }
                }
            }
            .navigationTitle("Add Time")
        }
    }
}