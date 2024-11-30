//
//  MainMenu+Actions.swift
//  TMSDKDemoIntegration
//
//  Created by Jonathan Backer on 7/5/23.
//

import Foundation
import UIKit
import TicketmasterFoundation
import TicketmasterAuthentication

extension MainMenuViewController {
    
    func menuAction(_ sender: Any?) {
        // Handle menu actions using mock data
        let vc = DiscoveryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showDiscovery() {
        let vc = DiscoveryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showTickets() {
        // Show mock tickets
        MockConfiguration.shared.mockHelper.getUserTickets { tickets in
            DispatchQueue.main.async {
                print("Mock Tickets:", tickets)
            }
        }
    }
    
    func verifyClientConfig(completion: @escaping (_ success: Bool) -> Void) {
        // Always succeed in mock mode
        completion(true)
    }
    
    func show(error: Error) {
        let vc = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        vc.addAction(action)
        present(vc, animated: true)
    }
}
