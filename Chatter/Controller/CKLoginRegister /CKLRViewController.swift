//
//  CKLRViewController.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import Material
import Pastel
import SnapKit

// abstract superclass that is inherited by login and register Controllers
class CKLRViewController : UIViewController, CKLRViewControllerAble {
    
    
    let loginInputsContainerHeight: CGFloat = 180
    let registerInputsContainerHeight: CGFloat = 250
    

    
    // inputs container, holds the inputs of the View. email/password
    var inputsContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        return view
    }()
    
    


    // general setup goes here, usually overriden by the subclass
    open func setup() {
        controllerViewConstraints()
        setupNavigationBar()

        view.backgroundColor = UIColor.flatWhite
    }
    
    

    fileprivate func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    open func externalSetup(type: CKLRViewControllerAble) {
        controllerTitleLabel.controllable = type
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
}
