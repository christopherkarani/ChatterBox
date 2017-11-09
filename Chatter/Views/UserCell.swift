//
//  UserCell.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
             return displayName.text = datasourceItem as? String
        }
    }

    let displayName : UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        addSubview(displayName)
        displayName.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
}
