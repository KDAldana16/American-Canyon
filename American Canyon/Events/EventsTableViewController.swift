//
//  EventsTableViewController.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/7/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    @IBOutlet var eventTable: UITableView!
    
    var data = EventDataLoader().eventData
    var headerData = [DataModal(headerName: "Events", isExpandable: false),
                      DataModal(headerName: "Favorites", isExpandable: false)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.tableFooterView = UIView()
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 10, y: 10, width: 400, height: 40))
        headerView.delegate = self
        headerView.secIndex = section
        headerView.btn.setTitle(headerData[section].headerName, for: .normal)
        
        return headerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if section == 0 {
            rowCount = data.count
        }
        
        if section == 1 {
            rowCount = 0
        }
        
        return rowCount
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "eventdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EventDetailViewController {
            destination.data = data[(eventTable.indexPathForSelectedRow?.row)!]
        }
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if indexPath.section != 0 { return nil }

        let favorite = UIContextualAction(style: .normal, title: "Favorite") { (favorite, view, completionHandler) in
            print("favorite \(indexPath.row)")
            completionHandler(true)
            func swiped(_ sender: UISwipeActionsConfiguration) {
                let fromIndexPath = IndexPath(row: 0, section: 0)
                let toIndexPath = IndexPath(row: 0, section: 1)
                (moveRowAt: fromIndexPath, to: toIndexPath)
            }
        }
            
        favorite.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        favorite.image = UIImage.checkmark

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
