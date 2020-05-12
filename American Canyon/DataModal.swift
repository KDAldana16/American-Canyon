//
//  DataModal.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/11/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import Foundation

class DataModal {
    var headerName: String?
    var isExpandable: Bool = false
    
    init(headerName: String, isExpandable: Bool) {
        self.headerName = headerName
        self.isExpandable = isExpandable
    }
}
