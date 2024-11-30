import Foundation
import UIKit
import TicketmasterAuthentication

// Temporary Configuration struct for compatibility
public struct Configuration {
    public static let badAPIKey = "BAD_API_KEY"
    
    public let apiKey: String?
    public let region: TMAuthentication.TMXDeploymentRegion
    public let displayName: String
    public let backgroundColor: UIColor?
    public let textTheme: TextTheme
    public let retailMarketDomain: String
    public let useMockData: Bool
    
    public enum TextTheme {
        case light
        case dark
        
        var color: UIColor {
            switch self {
            case .light:
                return .white
            case .dark:
                return .black
            }
        }
    }
    
    public init(apiKey: String? = nil,
               region: TMAuthentication.TMXDeploymentRegion = .US,
               displayName: String = "Ticketmaster Demo (Mock)",
               backgroundColor: UIColor? = .systemBlue,
               textTheme: TextTheme = .light,
               retailMarketDomain: String = "US",
               useMockData: Bool = true) {
        self.apiKey = apiKey
        self.region = region
        self.displayName = displayName
        self.backgroundColor = backgroundColor
        self.textTheme = textTheme
        self.retailMarketDomain = retailMarketDomain
        self.useMockData = useMockData
    }
}
