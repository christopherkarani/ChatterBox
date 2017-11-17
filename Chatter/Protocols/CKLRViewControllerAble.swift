//
//  CKLRViewController.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import UIKit

protocol CKLRViewControllerAble {
    var controllerTitle: String! { get set }
    var controllerTitleLabel: CKLRLabel! { get set }
}

extension CKLRViewControllerAble where Self: LoginController {
    var controllerTitle: String! {
        return "Login"
    }
}

extension CKLRViewControllerAble where Self: RegisterController {
    var controllerTitle: String! {
        return "Register"
    }
}
