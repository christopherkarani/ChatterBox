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
    var controllerTitleLabel : CKLRLabel!
    let loginInputsContainerHeight: CGFloat = 180
    let registerInputsContainerHeight: CGFloat = 250
    
    open var LoginRegisterButton: UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // inputs container, holds the inputs of the View. email/password
    var inputsContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        return view
    }()
    
    
    fileprivate func controllerViewConstraints() {
        controllerTitleLabel = CKLRLabel()
        controllerTitleLabel.textColor = UIColor.flatGreen
        
        func addSubviews() {
            view.addSubview(controllerTitleLabel!)
        }
        
        addSubviews()
        
        controllerTitleLabel?.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
    }

    // general setup goes here, usually overriden by the subclass
    open func setup() {
        controllerViewConstraints()
        setupNavigationBar()
        //setupPastelBackground()
        view.backgroundColor = UIColor.flatWhite
    }
    
    open func setloginRegisterTitile(_ title: String) {
        self.LoginRegisterButton.setTitle(title, for: .normal)
    }
    
    internal func handleCreateInputsContainer(withHeight height: CGFloat) {
        view.addSubview(inputsContainerView)
        inputsContainerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(controllerTitleLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-20)
            make.height.equalTo(height)
        }
    }
    
    private func setupPastelBackground() {
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 3.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
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
