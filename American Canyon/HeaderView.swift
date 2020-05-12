//
//  HeaderView.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/11/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

protocol HeaderDelegate {
    func cellHeader(idx: Int)
}

class HeaderView: UIView {
    
    var secIndex: Int?
    var delegate: HeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btn.backgroundColor = UIColor.systemTeal
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func onClickHeaderView() {
        if let idx = secIndex {
            delegate?.cellHeader(idx: idx)
        }
    }

}
