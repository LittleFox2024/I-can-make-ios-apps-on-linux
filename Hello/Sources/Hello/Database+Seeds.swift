import Foundation
import SQLiteData

extension DependencyValues {
    func seedDatabaseForPreviews() throws {
        try defaultDatabase.write { db in
            try db.seed {
                Dog(id: UUID(), name: "Moxie")
                Dog(id: UUID(), name: "Winter")
                Dog(id: UUID(), name: "Elphy")
            }
        }
    }
}