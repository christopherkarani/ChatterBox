//
//  CKLRTitle.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import Material

class CKLRLabel : UILabel {

    init(text inputText: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        text = inputText
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 30)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
