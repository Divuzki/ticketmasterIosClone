import Foundation
import UIKit

public class MockAPIHelper {
    public static let shared = MockAPIHelper()
    private let mockData = MockDataProvider.shared
    
    // MARK: - Discovery API Mocks
    public func searchEvents(query: String, completion: @escaping ([MockEvent]) -> Void) {
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let results = self.mockData.searchEvents(query: query)
            completion(results)
        }
    }
    
    public func getEventDetails(eventId: String, completion: @escaping (MockEvent?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let event = self.mockData.mockEvents.first(where: { $0.id == eventId })
            completion(event)
        }
    }
    
    // MARK: - Purchase API Mocks
    public func purchaseTicket(for eventId: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let success = self.mockData.purchaseTicket(for: eventId)
            completion(success)
        }
    }
    
    // MARK: - Tickets API Mocks
    public func getUserTickets(completion: @escaping ([MockUserTicket]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(self.mockData.mockUserTickets)
        }
    }
    
    // MARK: - Authentication Mocks
    public func isUserLoggedIn() -> Bool {
        return true // Always return logged in for mock mode
    }
    
    public func login(completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(true) // Always succeed in mock mode
        }
    }
    
    public func logout(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            completion()
        }
    }
}
