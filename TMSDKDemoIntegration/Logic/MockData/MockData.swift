import Foundation
import UIKit

// MARK: - Mock Event Types
public struct MockEvent {
    let id: String
    let name: String
    let date: Date
    let venue: String
    let imageUrl: String
    let minPrice: Double
    let maxPrice: Double
}

// MARK: - Mock Ticket Types
public struct MockUserTicket {
    let eventId: String
    let eventName: String
    let eventDate: Date
    let venue: String
    let seatInfo: String
    let barcode: String
    let orderNumber: String
}

// MARK: - Mock Order Types
public struct MockOrder {
    let orderId: String
    let eventId: String
    let tickets: [MockUserTicket]
    let purchaseDate: Date
    let totalAmount: Double
}
