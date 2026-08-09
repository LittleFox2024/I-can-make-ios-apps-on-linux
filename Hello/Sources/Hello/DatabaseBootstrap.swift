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
            try #sql("""
                CREATE TABLE dogs (
                    id TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                    name TEXT NOT NULL DEFAULT "Puppy"
                ),
                CREATE TABLE times (
                    id TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                    time TEXT NOT NULL DEFAULT "00:00",
                    dogId TEXT NOT NULL REFERENCES dogs(id) ON DELETE CASCADE
                )
            """)
            .execute(db)
        }
        try migrator.migrate(database)
        defaultDatabase = database
    }
}