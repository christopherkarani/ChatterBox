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
    
    let textview : UITextView = {
        let tv = UITextView()
        return tv
    }()
    var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "chris")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
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
    
    override func setupViews() {
        super.setupViews()
        setupSeperatorLineView()
        addViews()
        backgroundColor = .white
    }
}
