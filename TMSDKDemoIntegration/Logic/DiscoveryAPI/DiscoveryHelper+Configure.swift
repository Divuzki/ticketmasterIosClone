//
//  DiscoveryHelper+Configure.swift
//  TMSDKDemoIntegration
//
//  Created by Jonathan Backer on 7/6/23.
//

import Foundation
import TicketmasterDiscoveryAPI // for DiscoveryService and TMDiscoveryAPI

extension DiscoveryHelper {
    
    static func configure(with configuration: Configuration) {
        guard let apiKey = configuration.apiKey else {
            if configuration.useMockData {
                print("Using mock data for Discovery API")
                return
            }
            fatalError("Set your apiKey in Configuration.swift")
        }
        
        // PrePurchase does NOT use TicketmasterAuthentication,
        //  so no need to configure TicketmasterAuthentication first

        print("DiscoveryAPI Configuring...")

        // was:
        //TMDiscoveryAPI.shared.apiKey = configuration.apiKey
        //TMDiscoveryAPI.shared.marketDomain = configuration.retailMarketDomain

        // now:
        TMDiscoveryAPI.shared.configure(apiKey: apiKey,
                                        region: configuration.region) { _ in
            self.discoveryService = TMDiscoveryAPI.shared.discoveryService
            
            print(" - DiscoveryAPI Configured")
        }
    }
}
