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



class CKLRViewController : UIViewController, CKLRViewControllerAble {
    
    var controllerTitle: String! {
        didSet {
            controllerTitleLabel?.text = controllerTitle
        }
    }
    var controllerTitleLabel : CKLRLabel!
    
    private func setupTitle() {
        
    }
    
    open var LoginRegisterButton: UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func controllerViewConstraints() {
        controllerTitleLabel = CKLRLabel()
        
        func addSubviews() {
            view.addSubview(controllerTitleLabel!)
        }
        
        addSubviews()
        
        controllerTitleLabel?.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    

    
    private func setup() {
        controllerViewConstraints()
        setupNavigationBar()
        setupPastelBackground()
    }
    
    open func setloginRegisterTitile(_ title: String) {
        self.LoginRegisterButton.setTitle(title, for: .normal)
    }
    
    internal func setupPastelBackground() {
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
    
    open func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
}
