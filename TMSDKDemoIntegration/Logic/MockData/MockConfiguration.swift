import Foundation
import UIKit
import TicketmasterAuthentication

// Simple configuration for mock mode
public class MockConfiguration {
    public static let shared = MockConfiguration()
    
    public let mockHelper = MockAPIHelper.shared
    public let displayName = "Ticketmaster Demo (Mock)"
    
    private init() {}
    
    // Mock helpers for compatibility
    public var discoveryHelper: Any? = nil
    public var purchaseHelper: Any? = nil
    public var prePurchaseHelper: Any? = nil
    public var ticketsHelper: Any? = nil
    public var authenticationHelper: Any? = nil
    
    // Mock configuration values
    public var region: TMAuthentication.TMXDeploymentRegion = .US
    
    // Mock methods
    public func configureAuthenticationIfNeeded(completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func configureDiscoveryAPIIfNeeded(completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func configurePrePurchaseIfNeeded(completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func configurePurchaseIfNeeded(completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func configureTicketsIfNeeded(completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func printVersions() {
        print("Running in Mock Mode")
    }
}
