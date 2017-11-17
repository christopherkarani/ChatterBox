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
    
    let stackHeightConstant: CGFloat = 150
    var stackView: UIStackView!
    
    // inputs container, holds the inputs of the View. email/password
    var inputsContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
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
        let imageViewIcon = UIImageView(image: Icon.email)
        imageViewIcon.backgroundColor = Color.amber.base
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
        textField.placeholderAnimation = .hidden
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    func createStackView() {
        
        // two placeHolder views that hold my textViews
        let view1 = UIView()
        let view2 = UIView()

        let arrangedSubviews : [UIView] = [view1, view2]
        handleSetupStackView(withViews: arrangedSubviews)

        view1.addSubview(emailTextField)
        view2.addSubview(passwordTextField)
        
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
        handleCreateInputsContainer()
        createStackView()
        setupTapGesture()
        
        print(emailTextField.leftView ?? UIView())
    }
}
