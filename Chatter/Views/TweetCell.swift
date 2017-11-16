//
//  TweetCell.swift
//  Chatter
//
//  Created by Christopher Brandon Karani on 15/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            handleDataSource(withDataSource: datasourceItem)
        }
    }
    
    let textview : UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        return tv
    }()
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "chris")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    var replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    var directMessageButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    

    //MARK: SetupViews()
    override func setupViews() {
        super.setupViews()
        setupSeperatorLineView()
        addViews()
        backgroundColor = .white
        setupBottomButtons()
    }
    
    private func setupSeperatorLineView() {
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    }
    
    private func addViews() {
        addSubview(profileImageView)
        addSubview(textview)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        textview.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    fileprivate func setupBottomButtons() {
        let replyContainerView = UIView()
        let directMessageContainerView = UIView()
        let retweetContainerView = UIView()
        let likeContainerView = UIView()

        let aranagedSubviews : [UIView] = [replyContainerView, directMessageContainerView, retweetContainerView, likeContainerView]
        
        let stackView = UIStackView(arrangedSubviews: aranagedSubviews)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        stackView.anchor(nil, left: textview.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        replyButton.anchor(nil, left: replyContainerView.leftAnchor, bottom: replyContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(nil, left: retweetContainerView.leftAnchor, bottom: retweetContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(nil, left: likeContainerView.leftAnchor, bottom: likeContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        directMessageButton.anchor(nil, left: directMessageContainerView.leftAnchor, bottom: directMessageContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
 
    }
    
    func handleDataSource(withDataSource datasourceIten: Any?) {
        guard let tweet = datasourceItem as? Tweet else { return }
        
        let attributedText = NSMutableAttributedString(string: tweet.user.displayName, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
        
        let userNameString = "  \(tweet.user.userName)\n"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let range = NSRange.init(location: 0, length: attributedText.string.count)
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        
        attributedText.append(NSAttributedString(string: userNameString, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: tweet.text, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
        
        textview.attributedText = attributedText
        profileImageView.image = tweet.user.profileImage
    }
}

















