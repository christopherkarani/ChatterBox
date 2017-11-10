//
//  Theme.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import UIKit

final class Theme: NSObject {
    static let shared = Theme()
    let userNameColor = UIColor(r: 130, g: 130, b: 130)
    let userNameFont = UIFont.systemFont(ofSize: 14)
    let displayNameFont = UIFont.boldSystemFont(ofSize: 15)
    let twitterBlue = UIColor(r: 61, g: 167, b: 244)
    let themeColor: UIColor = .black
    //UIColor(red:0.00, green:0.90, blue:0.46, alpha:1.0)
}
