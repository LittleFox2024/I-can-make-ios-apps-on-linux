import SQLiteData
import Foundation

@Table
struct Time: Codable, Identifiable {
    let id: UUID
    let time: Date
    let dogId: UUID
    let notes: String?
}