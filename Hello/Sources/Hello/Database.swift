import OSLog
import SQLiteData


func appDatabase() throws -> any DatabaseWriter {
  @Dependency(\.context) var context
  let configuration = Configuration()
  let database = try defaultDatabase(configuration: configuration)
  logger.info("open '\(database.path)'")
  var migrator = DatabaseMigrator()
  migrator.registerMigration("Create tables") { db in
    try #sql("""
    CREATE TABLE "dogs"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT NOT NULL
    ) STRICT
    """)
    .execute(db)
  }
  try migrator.migrate(database)
  return database
}


private let logger = Logger(subsystem: "MyApp", category: "Database")