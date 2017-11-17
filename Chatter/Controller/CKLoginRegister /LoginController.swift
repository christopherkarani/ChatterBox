//
//  LoginController.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import Material
import Motion
import ChameleonFramework
import SnapKit

class LoginController: CKLRViewController {
    
    let stackHeightConstant: CGFloat = 180
    var stackView: UIStackView!
    
    // inputs container, holds the inputs of the View. email/password
    var inputsContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        return view
    }()
    
    // request toresign TextFields from firstResponser
    @objc func handleResignFirstResponder() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // resign TextFields from firstResponser with a simple tap
    fileprivate func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleResignFirstResponder))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    /// the email textField
    var emailTextField: TextField! = {
        let textField = ErrorTextField()
        textField.placeholder = "Email"
        textField.clearButtonMode = .whileEditing
        textField.font = RobotoFont.regular(with: 15)
        textField.placeholderAnimation = .hidden
        return textField
    }()
    
    var passwordTextField: ErrorTextField = {
        let textField = ErrorTextField()
        textField.placeholder = "Password"
        textField.font = RobotoFont.regular(with: 15)
        textField.detail = "atleast 6 characters"
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        textField.placeholderAnimation = .hidden
        return textField
    }()
    
    var loginButton: RaisedButton = {
        let button = RaisedButton(title: "Log-In", titleColor: Color.flatBlack)
        button.titleLabel?.font = RobotoFont.bold(with: 16)
        button.backgroundColor = UIColor.flatGreen
        button.pulseColor = UIColor.flatForestGreen
        return button
    }()
    
    
    func setupViews() {
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(70)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(-8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(70)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(inputsContainerView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(inputsContainerView.snp.width)
            make.height.equalTo(50)
        }
        
    }
    
    func createStackView() {
        
        // two placeHolder views that hold my textViews
        let view1 = UIView()

        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.flatGreen.cgColor
        let view2 = UIView()

        view2.layer.borderWidth = 2
        view2.layer.borderColor = UIColor.flatGreen.cgColor
        let view3 = UIView()
        
        var orLabel = UILabel()
        orLabel.text = "- OR -"
        orLabel.font = RobotoFont.bold(with: 15)
        orLabel.textAlignment = .center
        

        
        let arrangedSubviews : [UIView] = [view1, view2, view3]
        handleSetupStackView(withViews: arrangedSubviews)
        
        view1.addSubview(emailTextField)
        view2.addSubview(passwordTextField)
        view3.addSubview(loginButton)
        view.addSubview(orLabel)
        
        emailTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(12)
            make.height.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(12)
            make.height.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        orLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
    }
    
    /// handles the general setup for the UIStackview. The Stackview holds the emailTextField
    /// and passwordTextField.
    /// parameteres:
    /// - views : An Array of views for the stackview to layout
    private func handleSetupStackView(withViews views: [UIView]) {
        // general setup for the stackview
        stackView = UIStackView(arrangedSubviews: views)
        stackView.backgroundColor = .red
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        //
        inputsContainerView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
    /// handles adding inputsContainerView to view and sets The Constraints
    private func handleCreateInputsContainer() {
        view.addSubview(inputsContainerView)
        
        inputsContainerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(controllerTitleLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-20)
            make.height.equalTo(stackHeightConstant)
        }
        
    }
    
    
    
    override func setup() {
        super.setup()
        controllerTitleLabel.setTitle("Log In")
        controllerTitleLabel.textColor = UIColor.flatGreen
        handleCreateInputsContainer()
        createStackView()
        //setupViews()
        setupTapGesture()
        
        print(emailTextField.leftView ?? UIView())
    }
}
