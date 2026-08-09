import Foundation
import SQLiteData

extension DependencyValues {
    mutating func bootstrapDatabase() throws {
        let database = try SQLiteData.defaultDatabase()
        var migrator = DatabaseMigrator()

        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif

        migrator.registerMigration("Create the dogs database") { db in
            do {
                try #sql("""
                    CREATE TABLE dogs (
                        id TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                        name TEXT NOT NULL DEFAULT "Puppy"
                    )
                """)
                .execute(db)

                try #sql("""
                    CREATE TABLE times (
                        id TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                        dog_id TEXT NOT NULL REFERENCES dogs(id) ON DELETE CASCADE,
                        time TEXT NOT NULL,
                        note TEXT)
                """)
                .execute(db)
            } catch {
                print("Error creating tables: \(error)")
            }
        }
        try migrator.migrate(database)
        defaultDatabase = database
    }
}