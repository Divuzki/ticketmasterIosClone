import Foundation
import UIKit
import TicketmasterAuthentication

// Temporary ConfigurationManager class for compatibility
public class ConfigurationManager {
    public static let shared = ConfigurationManager()
    public static let badAPIKey = Configuration.badAPIKey
    
    public var currentConfiguration: Configuration
    public var mockConfiguration: MockConfiguration
    
    public var discoveryHelper: Any? = nil
    public var purchaseHelper: Any? = nil
    public var prePurchaseHelper: Any? = nil
    public var ticketsHelper: Any? = nil
    public var authenticationHelper: Any? = nil
    
    private init() {
        self.currentConfiguration = Configuration()
        self.mockConfiguration = MockConfiguration.shared
    }
    
    public func configureAuthenticationIfNeeded(completion: @escaping (Bool) -> Void) {
        // Always succeed in mock mode
        completion(true)
    }
    
    public func configureDiscoveryAPIIfNeeded(completion: @escaping (Bool) -> Void) {
        // Always succeed in mock mode
        completion(true)
    }
    
    public func configurePrePurchaseIfNeeded(completion: @escaping (Bool) -> Void) {
        // Always succeed in mock mode
        completion(true)
    }
    
    public func configurePurchaseIfNeeded(completion: @escaping (Bool) -> Void) {
        // Always succeed in mock mode
        completion(true)
    }
    
    public func configureTicketsIfNeeded(completion: @escaping (Bool) -> Void) {
        // Always succeed in mock mode
        completion(true)
    }
    
    public func printVersions() {
        print("Running in Mock Mode")
    }
}
