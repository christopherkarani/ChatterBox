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

class CKLRViewController : UIViewController, CKLRViewControllerAble {
    var controllerTitleLabel : CKLRLabel!


    
    open var LoginRegisterButton: UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate func controllerViewConstraints() {
        controllerTitleLabel = CKLRLabel()
        
        func addSubviews() {
            view.addSubview(controllerTitleLabel!)
        }
        
        addSubviews()
        
        controllerTitleLabel?.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
    }
    


    
    open func setup() {
        controllerViewConstraints()
        setupNavigationBar()
        setupPastelBackground()
    }
    

    open func setloginRegisterTitile(_ title: String) {
        self.LoginRegisterButton.setTitle(title, for: .normal)
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
