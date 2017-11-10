//
//  UserCell.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            displayName.text = user.displayName
            userName.text = user.userName
            displayText.text = user.displayText
            profileImageView.image = user.profileImage
        }
    }
    
    var displayName : UILabel = {
        let label = UILabel()
        label.text = "Christopher Karani"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    var userName : UILabel = {
        let label = UILabel();
        label.text = "@userName"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "chris")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let displayText : UITextView = {
       let tv = UITextView()
        tv.text = "I make apps, games & Swift developer tools. Blogging weekly & podcasting about Swift development."
        tv.backgroundColor = .clear
        return tv
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.layer.borderColor = Theme.shared.themeColor.cgColor
        button.layer.borderWidth = 1
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.setTitle("Follow", for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0)
        button.setTitleColor(Theme.shared.themeColor, for: .normal)
        button.tintColor = Theme.shared.themeColor
        //button.titleEdgeInsets
        return button
    }()
    
    
    private func setupSeperatorView() {
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    }
    
    override func setupViews() {
        super.setupViews()
        setupSeperatorView() 
        addSubview(displayName)
        addSubview(profileImageView)
        addSubview(userName)
        addSubview(displayText)
        addSubview(followButton)
        
        let topConstantPadding : CGFloat = 12
        let rightConstantPadding: CGFloat = 8
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: topConstantPadding, leftConstant: 12, bottomConstant: 0, rightConstant: rightConstantPadding, widthConstant: 50, heightConstant: 50)
        
        displayName.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        
        userName.anchor(displayName.bottomAnchor, left: displayName.leftAnchor, bottom: nil, right: displayName.rightAnchor, topConstant: -4 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        displayText.anchor(userName.bottomAnchor, left: userName.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: topConstantPadding, leftConstant: 0, bottomConstant: 0, rightConstant: rightConstantPadding, widthConstant: 120, heightConstant: 35)
        
    }
}
