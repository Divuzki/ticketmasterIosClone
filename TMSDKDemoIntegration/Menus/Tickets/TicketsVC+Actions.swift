//
//  TicketsVC+Actions.swift
//  TMSDKDemoIntegration
//
//  Created by Jonathan Backer on 7/5/23.
//

import Foundation
import UIKit
import TicketmasterFoundation
import TicketmasterTickets

extension TicketsViewController {
    
    @objc func menuAction(_ sender: Any?) {
        // Use mock data instead
        MockConfiguration.shared.mockHelper.getUserTickets { tickets in
            DispatchQueue.main.async {
                // Present tickets UI
                print("Mock Tickets:", tickets)
            }
        }
    }
    
    func menuBuilderDataSource(_: MenuBuilderDataSource, didAction action: MenuBuilderAction, forCell cell: MenuBuilderTableViewCell) {
        
        guard let ticketsHelper = ConfigurationManager.shared.ticketsHelper else { return }
        
        // try to determine which cell this is
        if let cellIdentifier = CellIdentifier(rawValue: cell.cellInfo.uniqueIdentifier) {
            print("\(cellIdentifier.rawValue): \(action.debugString)")
            switch cellIdentifier {
            case .presentTicketsPush:
                ticketsHelper.pushTickets(onViewController: self)

            case .presentTicketsModal:
                ticketsHelper.presentTickets(onViewController: self)
                
            case .presentTicketsEmbeddedPush:
                ticketsHelper.pushEmbeddedTickets(onViewController: self)
                
            case .presentTicketsEmbeddedModal:
                ticketsHelper.presentEmbeddedTickets(onViewController: self)
                
            case .displayOrder:
                switch action {
                case .returnPressed(let value), .valueChanged(let value):
                    displayIdentifier = value
                default:
                    break
                }
                
                if let displayIdentifier = displayIdentifier {
                    ticketsHelper.presentTickets(orderOrEventID: displayIdentifier, onViewController: self)
                }
            }
        }
    }
}
