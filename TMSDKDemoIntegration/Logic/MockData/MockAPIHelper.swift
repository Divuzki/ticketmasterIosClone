import Foundation
import UIKit

public class MockAPIHelper {
    public static let shared = MockAPIHelper()
    private let dataProvider = MockDataProvider()
    
    private init() {}
    
    // Simulated network delay
    private func simulateNetworkDelay(_ completion: @escaping () -> Void) {
        let delay = Double.random(in: 0.5...1.5)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: completion)
    }
    
    // MARK: - Event Methods
    public func getEvents(completion: @escaping ([MockEvent]) -> Void) {
        simulateNetworkDelay {
            completion(self.dataProvider.getMockEvents())
        }
    }
    
    public func getEvent(id: String, completion: @escaping (MockEvent?) -> Void) {
        simulateNetworkDelay {
            completion(self.dataProvider.getMockEvent(id: id))
        }
    }
    
    // MARK: - Ticket Methods
    public func getUserTickets(completion: @escaping ([MockUserTicket]) -> Void) {
        simulateNetworkDelay {
            completion(self.dataProvider.getMockUserTickets())
        }
    }
    
    public func getTicket(barcode: String, completion: @escaping (MockUserTicket?) -> Void) {
        simulateNetworkDelay {
            completion(self.dataProvider.getMockUserTicket(barcode: barcode))
        }
    }
    
    // MARK: - Order Methods
    public func getOrders(completion: @escaping ([MockOrder]) -> Void) {
        simulateNetworkDelay {
            completion(self.dataProvider.getMockOrders())
        }
    }
    
    public func getOrder(orderId: String, completion: @escaping (MockOrder?) -> Void) {
        simulateNetworkDelay {
            completion(self.dataProvider.getMockOrder(orderId: orderId))
        }
    }
}
