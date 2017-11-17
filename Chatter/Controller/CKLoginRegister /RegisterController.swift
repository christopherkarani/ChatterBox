//
//  ResgiterController.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import UIKit

class RegisterController: CKLRViewController {
    override func setup() {
        super.setup()
        controllerTitleLabel.setTitle("Log In")
    }
    
    func createStackView() {
        let view1 = UIView()
        view1.backgroundColor = UIColor.flatGreen
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.flatBlue
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.flatLime
        
        let view4 = UIView()
        view4.backgroundColor = UIColor.flatSand
        
        let arrangedSubviews : [UIView] = [view1, view2, view3, view4]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.backgroundColor = .red
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        
        
//        inputsContainerView.addSubview(stackView)
//        stackView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
//        
//        setupTextViews()
        
    }
}
