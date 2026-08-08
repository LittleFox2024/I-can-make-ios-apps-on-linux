import SwiftUI
import UserNotifications
import SQLiteData

struct HomeView: View{
    //@FetchAll private var dogs: [Dog]
    @FetchAll(Dog.order(by: \.name)) private var dogs
    @Dependency(\.defaultDatabase) var database
    //@State var dogs = sampleDogs

    var body: some View {
        NavigationStack{
            Group {
                if dogs.isEmpty {
                    Text("No Dogs")
                } else {
                    List(dogs) { dog in
                        VStack(alignment: .leading){
                            Text(dog.name)
                        }
                        .swipeActions(edge: .trailing){
                            Button("Delete", role: .destructive) {
                                withErrorReporting {
                                    try database.write { db in
                                        try Dog.delete(dog)
                                        .execute(db)
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Dogs")
        }
    }
}