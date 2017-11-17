//
//  CKLRTitle.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import Foundation

class CKLRLabel : UILabel {
    var controllable: CKLRViewControllerAble?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setText()
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setText() {
        text = controllable is LoginController.Type ? "Log-In" : "Register"
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
