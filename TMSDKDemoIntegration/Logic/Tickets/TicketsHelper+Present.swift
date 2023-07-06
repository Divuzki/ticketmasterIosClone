//
//  TicketsHelper+Present.swift
//  TMSDKDemoIntegration
//
//  Created by Jonathan Backer on 7/5/23.
//

import Foundation
import UIKit
import TicketmasterTickets

extension TicketsHelper {
    
    func pushTickets(orderOrEventID: String? = nil, onViewController viewController: UIViewController) {
        let newTicketsVC = TMTicketsViewController()
        
        // do not add logout button to the navbar
        newTicketsVC.addLogoutButton = false
        
        // weak store vc
        ticketsVC = newTicketsVC
        
        viewController.navigationController?.pushViewController(newTicketsVC, animated: true)
        if let orderOrEventID = orderOrEventID {
            // since we are animating the VC onto the stack, give it a moment to finish animating
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                TMTickets.shared.display(orderOrEventId: orderOrEventID)
            }
        }
    }

    func presentTickets(orderOrEventID: String? = nil, onViewController viewController: UIViewController) {
        let newTicketsVC = TMTicketsViewController()
        
        // do not add logout button to the header
        newTicketsVC.addLogoutButton = false

        // weak store vc
        ticketsVC = newTicketsVC
        
        viewController.navigationController?.present(newTicketsVC, animated: true, completion: {
            if let orderOrEventID = orderOrEventID {
                TMTickets.shared.display(orderOrEventId: orderOrEventID)
            }
        })
    }
}
