//
//  EventDataLoader.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/7/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import Foundation

public class EventDataLoader {
    
    @Published var eventData = [EventData]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "events", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([EventData].self, from: data)
                
                self.eventData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func sort() {
        self.eventData = self.eventData.sorted(by: { $0.event_id < $1.event_id} )
    }
}

