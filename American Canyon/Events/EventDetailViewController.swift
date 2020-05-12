//
//  EventDetailViewController.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/7/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    var data: EventData?
    
    @IBOutlet weak var labelDetailName: UILabel!
    @IBOutlet weak var labelDetailDate: UILabel!
    @IBOutlet weak var labelDetailTime: UILabel!
    @IBOutlet weak var labelDetailLocation: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        labelDetailName.text = data?.event_name
        labelDetailDate.text = data?.event_date
        labelDetailTime.text = data?.event_time
        labelDetailLocation.text = data?.event_location
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
