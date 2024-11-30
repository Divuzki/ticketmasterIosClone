import Foundation
import UIKit

// MARK: - Mock Event Types
public struct MockEvent: Codable, Hashable {
    public let id: String
    public let name: String
    public let date: String
    public let venue: String
    public let imageURL: String
    public let price: String
    
    public init(id: String, name: String, date: String, venue: String, imageURL: String, price: String) {
        self.id = id
        self.name = name
        self.date = date
        self.venue = venue
        self.imageURL = imageURL
        self.price = price
    }
}

// MARK: - Mock Ticket Types
public struct MockUserTicket: Codable, Hashable {
    public let eventName: String
    public let eventDate: String
    public let seatInfo: String
    public let barcode: String
    
    public init(eventName: String, eventDate: String, seatInfo: String, barcode: String) {
        self.eventName = eventName
        self.eventDate = eventDate
        self.seatInfo = seatInfo
        self.barcode = barcode
    }
}
