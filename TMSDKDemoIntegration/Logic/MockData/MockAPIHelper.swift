import Foundation
import UIKit

class MockAPIHelper {
    static let shared = MockAPIHelper()
    private let mockData = MockDataProvider.shared
    
    // MARK: - Discovery API Mocks
    func searchEvents(query: String, completion: @escaping ([MockDataProvider.MockEvent]) -> Void) {
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let results = self.mockData.searchEvents(query: query)
            completion(results)
        }
    }
    
    func getEventDetails(eventId: String, completion: @escaping (MockDataProvider.MockEvent?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let event = self.mockData.mockEvents.first(where: { $0.id == eventId })
            completion(event)
        }
    }
    
    // MARK: - Purchase API Mocks
    func purchaseTicket(for eventId: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let success = self.mockData.purchaseTicket(for: eventId)
            completion(success)
        }
    }
    
    // MARK: - Tickets API Mocks
    func getUserTickets(completion: @escaping ([MockDataProvider.MockUserTicket]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(self.mockData.mockUserTickets)
        }
    }
    
    // MARK: - Authentication Mocks
    func isUserLoggedIn() -> Bool {
        return true // Always return logged in for mock mode
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(true) // Always succeed in mock mode
        }
    }
    
    func logout(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            completion()
        }
    }
}
