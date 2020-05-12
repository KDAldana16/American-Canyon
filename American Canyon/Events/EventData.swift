//
//  EventData.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/7/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import Foundation

struct EventData: Codable {
    
    var event_id: Int
    var event_name: String
    var event_date: String
    var event_time: String
    var event_location: String
//    let isFavorite: Bool
}
