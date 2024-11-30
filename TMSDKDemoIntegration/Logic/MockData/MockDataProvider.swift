import Foundation
import UIKit

// Mock data provider to replace API calls
class MockDataProvider {
    static let shared = MockDataProvider()
    
    // Mock Events
    struct MockEvent {
        let id: String
        let name: String
        let date: String
        let venue: String
        let imageURL: String
        let price: String
    }
    
    let mockEvents: [MockEvent] = [
        MockEvent(
            id: "mock1",
            name: "Taylor Swift | The Eras Tour",
            date: "Dec 31, 2024 7:00 PM",
            venue: "SoFi Stadium, Los Angeles",
            imageURL: "taylor_swift",
            price: "$49.99 - $499.99"
        ),
        MockEvent(
            id: "mock2",
            name: "Ed Sheeran World Tour",
            date: "Jan 15, 2024 8:00 PM",
            venue: "Madison Square Garden, New York",
            imageURL: "ed_sheeran",
            price: "$39.99 - $299.99"
        ),
        MockEvent(
            id: "mock3",
            name: "NBA All-Star Game 2024",
            date: "Feb 18, 2024 8:00 PM",
            venue: "Gainbridge Fieldhouse, Indianapolis",
            imageURL: "nba_allstar",
            price: "$199.99 - $999.99"
        ),
        MockEvent(
            id: "mock4",
            name: "Beyoncé | RENAISSANCE WORLD TOUR",
            date: "Mar 1, 2024 7:30 PM",
            venue: "AT&T Stadium, Dallas",
            imageURL: "beyonce",
            price: "$59.99 - $599.99"
        ),
        MockEvent(
            id: "mock5",
            name: "Coldplay Music Of The Spheres Tour",
            date: "Apr 15, 2024 7:00 PM",
            venue: "Wembley Stadium, London",
            imageURL: "coldplay",
            price: "$45.99 - $399.99"
        )
    ]
    
    // Mock User Data
    struct MockUserTicket {
        let eventName: String
        let eventDate: String
        let seatInfo: String
        let barcode: String
    }
    
    let mockUserTickets: [MockUserTicket] = [
        MockUserTicket(
            eventName: "Taylor Swift | The Eras Tour",
            eventDate: "Dec 31, 2024",
            seatInfo: "Section A, Row 1, Seat 15",
            barcode: "0123456789"
        ),
        MockUserTicket(
            eventName: "NBA All-Star Game 2024",
            eventDate: "Feb 18, 2024",
            seatInfo: "Section 112, Row 20, Seat 7",
            barcode: "9876543210"
        )
    ]
    
    // Mock Search Results
    func searchEvents(query: String) -> [MockEvent] {
        // Simple mock search that returns all events containing the query string
        return mockEvents.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
    
    // Mock Purchase Result
    func purchaseTicket(for eventId: String) -> Bool {
        // Simulate successful purchase 90% of the time
        return Double.random(in: 0...1) < 0.9
    }
}
