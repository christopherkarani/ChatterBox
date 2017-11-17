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
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(whiteView)
        addSubview(textLabel)
        
        whiteView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)

    }
}
