//
//  CKLRTitle.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import Material

class CKLRLabel : UILabel {
    var controllable: CKLRViewControllerAble?
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        setText()
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setText() {
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    open func setTitle(_ string: String) {
        text = string
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
