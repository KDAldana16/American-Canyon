//
//  EventsTableViewController.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/7/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    var data = EventDataLoader().eventData
    var headerData = [DataModal(headerName: "Events", isExpandable: false),
                      DataModal(headerName: "Favorites", isExpandable: false)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.tableFooterView = UIView()
//         self.clearsSelectionOnViewWillAppear = false
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: 425, height: 40))
        headerView.delegate = self
        headerView.secIndex = section
        headerView.btn.setTitle(headerData[section].headerName, for: .normal)
        
        return headerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if headerData[section].isExpandable {
            return data.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if headerData[indexPath.section].isExpandable {
            return 40
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "event")
        cell!.textLabel?.text = EventDataLoader().eventData[indexPath.row].event_name

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favorite = UIContextualAction(style: .normal, title: "Favorite") { (favorite, view, nil) in
            print("Favorite")
        }
        favorite.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        favorite.image = .checkmark
        
        let config = UISwipeActionsConfiguration(actions: [favorite])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    

}

extension EventsTableViewController: HeaderDelegate {
    func cellHeader(idx: Int) {
        headerData[idx].isExpandable = !headerData[idx].isExpandable
        tableView.reloadSections([idx], with: .automatic)
        
    }
    
}
