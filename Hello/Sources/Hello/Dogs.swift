import SQLiteData
import Foundation

@Table
struct Dog: Codable, Identifiable {
    let id: UUID
    let name: String
}

@Table
struct Time: Codable, Identifiable {
    let id: UUID
    let time: String
    let dogId: UUID
}