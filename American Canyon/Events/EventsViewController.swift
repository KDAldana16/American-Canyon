//
//  ViewController.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/7/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    let data = EventDataLoader().eventData
              
    print(data)
    }


}

