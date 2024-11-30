import Foundation
import UIKit

// Mock data provider to replace API calls
public class MockDataProvider {
    public static let shared = MockDataProvider()
    
    // MARK: - Mock Events
    public struct MockEvent {
        let id: String
        let name: String
        let date: Date
        let venue: String
        let imageUrl: String
        let minPrice: Double
        let maxPrice: Double
    }
    
    private let mockEvents: [MockEvent] = [
        MockEvent(
            id: "event1",
            name: "Taylor Swift | The Eras Tour",
            date: Date().addingTimeInterval(86400 * 7),
            venue: "SoFi Stadium, Los Angeles",
            imageUrl: "https://example.com/taylorswift.jpg",
            minPrice: 49.99,
            maxPrice: 499.99
        ),
        MockEvent(
            id: "event2",
            name: "Ed Sheeran World Tour",
            date: Date().addingTimeInterval(86400 * 14),
            venue: "MetLife Stadium, New Jersey",
            imageUrl: "https://example.com/edsheeran.jpg",
            minPrice: 39.99,
            maxPrice: 299.99
        )
    ]
    
    // MARK: - Mock Tickets
    public struct MockUserTicket {
        let eventId: String
        let eventName: String
        let eventDate: Date
        let venue: String
        let seatInfo: String
        let barcode: String
        let orderNumber: String
    }
    
    private let mockTickets: [MockUserTicket] = [
        MockUserTicket(
            eventId: "event1",
            eventName: "Taylor Swift | The Eras Tour",
            eventDate: Date().addingTimeInterval(86400 * 7),
            venue: "SoFi Stadium, Los Angeles",
            seatInfo: "Section A, Row 10, Seat 15",
            barcode: "123456789",
            orderNumber: "TM123456"
        ),
        MockUserTicket(
            eventId: "event2",
            eventName: "Ed Sheeran World Tour",
            eventDate: Date().addingTimeInterval(86400 * 14),
            venue: "MetLife Stadium, New Jersey",
            seatInfo: "Section B, Row 20, Seat 25",
            barcode: "987654321",
            orderNumber: "TM789012"
        )
    ]
    
    // MARK: - Mock Orders
    public struct MockOrder {
        let orderId: String
        let eventId: String
        let tickets: [MockUserTicket]
        let purchaseDate: Date
        let totalAmount: Double
    }
    
    private let mockOrders: [MockOrder] = [
        MockOrder(
            orderId: "TM123456",
            eventId: "event1",
            tickets: [mockTickets.first(where: { $0.orderNumber == "TM123456" })!],
            purchaseDate: Date().addingTimeInterval(-86400),
            totalAmount: 299.98
        ),
        MockOrder(
            orderId: "TM789012",
            eventId: "event2",
            tickets: [mockTickets.first(where: { $0.orderNumber == "TM789012" })!],
            purchaseDate: Date().addingTimeInterval(-86400 * 2),
            totalAmount: 199.98
        )
    ]
    
    // MARK: - Public Methods
    public func getMockEvents() -> [MockEvent] {
        return mockEvents
    }
    
    public func getMockEvent(id: String) -> MockEvent? {
        return mockEvents.first { $0.id == id }
    }
    
    public func getMockUserTickets() -> [MockUserTicket] {
        return mockTickets
    }
    
    public func getMockUserTicket(barcode: String) -> MockUserTicket? {
        return mockTickets.first { $0.barcode == barcode }
    }
    
    public func getMockOrders() -> [MockOrder] {
        return mockOrders
    }
    
    public func getMockOrder(orderId: String) -> MockOrder? {
        return mockOrders.first { $0.orderId == orderId }
    }
    
    // Mock Search Results
    public func searchEvents(query: String) -> [MockEvent] {
        // Simple mock search that returns all events containing the query string
        return mockEvents.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
    
    // Mock Purchase Result
    public func purchaseTicket(for eventId: String) -> Bool {
        // Simulate successful purchase 90% of the time
        return Double.random(in: 0...1) < 0.9
    }
}
