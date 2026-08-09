import Foundation
import SwiftUI
import SQLiteData

struct DetailsView: View {
    @Dependency(\.defaultDatabase) var database
    @FetchAll(Time.order(by: \.time)) private var times

    var body: some View {
        NavigationStack{
            Group {
                if times.isEmpty {
                    Text("No Times")
                } else {
                    List(times) { time in
                        VStack(alignment: .leading){
                            Text(time.time)
                        }
                        .swipeActions(edge: .trailing){
                            Button("Delete", role: .destructive) {
                                withErrorReporting {
                                    try database.write { db in
                                        try Time.delete(time)
                                        .execute(db)
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Times")
        }
    }

}