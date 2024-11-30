//
//  MainMenu+BuildMenu.swift
//  TMSDKDemoIntegration
//
//  Created by Jonathan Backer on 7/5/23.
//

import Foundation
import UIKit
import TicketmasterFoundation
import TicketmasterAuthentication
import TicketmasterDiscoveryAPI
import TicketmasterPrePurchase
import TicketmasterPurchase
import TicketmasterTickets

extension MainMenuViewController {
    
    func buildMenu() {
        menuDataSource.sections = [
            buildSectionDiscovery(),
            buildSectionTickets()
        ]
        
        didBuildMenu = true
        tableView.reloadData()
    }
    
    private func buildSectionDiscovery() -> MenuBuilderSectionInfo {
        var cellInfoArray: [MenuBuilderCellInfo] = []
        
        // Discovery API
        cellInfoArray.append(
            MenuBuilderCellInfo(title: "Discovery API",
                              valueText: nil,
                              accessoryType: .disclosureIndicator) { [weak self] in
                let vc = DiscoveryViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        )
        
        return MenuBuilderSectionInfo(title: "Discovery", cellInfoRowArray: cellInfoArray)
    }
    
    private func buildSectionTickets() -> MenuBuilderSectionInfo {
        var cellInfoArray: [MenuBuilderCellInfo] = []
        
        // Tickets
        cellInfoArray.append(
            MenuBuilderCellInfo(title: "My Tickets",
                              valueText: nil,
                              accessoryType: .disclosureIndicator) { [weak self] in
                // Show mock tickets
                MockConfiguration.shared.mockHelper.getUserTickets { tickets in
                    DispatchQueue.main.async {
                        // Present tickets UI
                        print("Mock Tickets:", tickets)
                    }
                }
            }
        )
        
        return MenuBuilderSectionInfo(title: "Tickets", cellInfoRowArray: cellInfoArray)
    }
}
