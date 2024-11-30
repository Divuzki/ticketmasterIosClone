//
//  DiscoveryViewController.swift
//  RetailDevApp
//
//  Created by Jonathan Backer on 6/21/23.
//

import UIKit
import TicketmasterFoundation
import TicketmasterDiscoveryAPI

class DiscoveryViewController: UITableViewController {

    private var events: [MockEvent] = []
    private let mockHelper = MockAPIHelper.shared
    private var searchText: String = ""
    
    var menuDataSource = MenuBuilderDataSource()
    var didBuildMenu: Bool = false
    
    var selectedLanguage: DiscoveryLocale {
        return DiscoveryLocale(rawValue: UserDefaultsManager.shared.string(.discoveryLanguageString) ?? "") ?? .enUS
    }
    
    var selectedIdentifierType: DiscoveryHelper.DetailsIdentifierType {
        get {
            if let identifierString = UserDefaultsManager.shared.string(.discoveryIdentifierString),
               let identifier = DiscoveryHelper.DetailsIdentifierType(rawValue: identifierString) {
                return identifier
            } else {
                return .legacyHost
            }
        }
        set {
            UserDefaultsManager.shared.set(newValue.rawValue, forKey: .discoveryIdentifierString)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Discovery API"
        
        if ConfigurationManager.shared.configuration.useMockData {
            loadMockEvents()
        } else {
            loadRealEvents()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !didBuildMenu {
            buildMenu()
        }
    }
    
    private func loadMockEvents() {
        mockHelper.searchEvents(query: "") { [weak self] events in
            self?.events = events
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func loadRealEvents() {
        // Original API implementation here
    }
    
    // MARK: - Actions
    @objc func searchButtonTapped() {
        if ConfigurationManager.shared.configuration.useMockData {
            mockHelper.searchEvents(query: searchText) { [weak self] events in
                self?.events = events
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        } else {
            // Original search implementation
        }
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "EventCell")
        
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = "\(event.venue) - \(event.date)"
        
        return cell
    }
}
