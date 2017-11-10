//
//  FooterCell.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents


class FooterCell: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel();
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = Theme.shared.twitterBlue
        return label
    }()
    
    override func setupViews() {
        super.setupViews()

        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}
