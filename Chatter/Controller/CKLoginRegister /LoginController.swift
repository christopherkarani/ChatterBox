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
    

    let stackView = UIStackView()
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

    override func setup() {
        super.setup()
        controllerTitleLabel.setTitle("Log In")
        handleCreateInputsContainer()
        createStackView()
        setupTapGesture()
    }
}

extension LoginController: LoginService {
    func loginIn() {
        print("logging in")
    }
}
