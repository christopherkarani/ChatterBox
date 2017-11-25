//
//  CKLRViewController.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import UIKit


protocol CKLRViewControllerAble {
    var controllerTitleLabel: CKLRLabel! { get set }
    func handleCreateInputsContainer()
    func createStackView()
    func handleSetupStackView(withViews views: [UIView], setupStackView stackView: UIStackView, withAxis axis: UILayoutConstraintAxis, andSDistribution distribution: UIStackViewDistribution, andSpacing spacing: CGFloat ) -> UIStackView
    
    func hello()
}

extension CKLRViewControllerAble {
        func handleSetupStackView(withViews views: [UIView], setupStackView stackView: UIStackView, withAxis axis: UILayoutConstraintAxis, andSDistribution distribution: UIStackViewDistribution, andSpacing spacing: CGFloat ) -> UIStackView {
        
        // general setup for the stackview
            for view in views { stackView.addArrangedSubview(view) }
        stackView.backgroundColor = .red
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
    
}

extension CKLRViewControllerAble where Self: LoginController {
    
    var controllerTitleLabel: CKLRLabel = {
        get {
            return CKLRLabel(
        }
    }
    
    private func handleCreateInputsContainer() {
        view.addSubview(inputsContainerView)
        inputsContainerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(controllerTitleLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-20)
            make.height.equalTo(loginInputsContainerHeight)
        }
    }
    
    func hello() {
        print("hello")
    }
    
    func createStackView() {
        let specifiedSubViews : [UIView] = [emailTextField, passwordTextField, loginButton]
        let stackViewx = handleSetupStackView(withViews: specifiedSubViews, setupStackView: stackView, withAxis: .vertical, andSDistribution: .fillProportionally, andSpacing: 5)
        inputsContainerView.addSubview(stackViewx)
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}

extension CKLRViewControllerAble where Self: RegisterController {
    private func handleCreateInputsContainer() {
        view.addSubview(inputsContainerView)
        inputsContainerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(controllerTitleLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-20)
            make.height.equalTo(registerInputsContainerHeight)
        }
    }
}






