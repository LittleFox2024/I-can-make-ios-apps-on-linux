import SQLiteData
import Foundation

@Table
struct Dog: Codable, Identifiable {
    let id: UUID
    let name: String
}