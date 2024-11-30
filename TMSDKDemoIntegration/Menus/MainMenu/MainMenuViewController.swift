//
//  MainMenuViewController.swift
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
import TicketmasterSecureEntry
import TicketmasterTickets

class MainMenuViewController: UITableViewController {

    var menuDataSource = MenuBuilderDataSource()
    var didBuildMenu: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main Menu"
        
        MockConfiguration.shared.printVersions()
        
        buildMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !didBuildMenu {
            buildMenu()
        }
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return menuDataSource.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuDataSource.sections[section].cellInfoRowArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuDataSource.sections[section].title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        
        let cellInfo = menuDataSource.sections[indexPath.section].cellInfoRowArray[indexPath.row]
        cell.textLabel?.text = cellInfo.title
        cell.detailTextLabel?.text = cellInfo.valueText
        cell.accessoryType = cellInfo.accessoryType
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellInfo = menuDataSource.sections[indexPath.section].cellInfoRowArray[indexPath.row]
        cellInfo.action?()
    }
    
    func buildMenu() {
        // implement buildMenu logic here
    }
    
    func buildRefreshMenu() {
        // implement buildRefreshMenu logic here
    }
    
    func themeNavigationBar() {
        // implement themeNavigationBar logic here
    }
}
