import SQLiteData
import SwiftUI

@main
struct HelloApp: App {
    init() {
        prepareDependencies{
            do {
                try $0.bootstrapDatabase()
            } catch {
                fatalError("Failed to bootstrap database: \(error)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
