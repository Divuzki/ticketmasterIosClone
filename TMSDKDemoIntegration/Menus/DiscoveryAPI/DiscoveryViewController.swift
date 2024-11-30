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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Discovery API"
        loadMockEvents()
    }
    
    private func loadMockEvents() {
        mockHelper.searchEvents(query: "") { [weak self] events in
            self?.events = events
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Actions
    @objc func searchButtonTapped() {
        mockHelper.searchEvents(query: searchText) { [weak self] events in
            self?.events = events
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
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
