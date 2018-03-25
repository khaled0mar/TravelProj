//
//  NotificationsTableViewCell.swift
//  TravelProj
//
//  Created by khaled omar on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    
    var myMutableString = NSMutableAttributedString()
    var notificationRightAnchorWithFollowButton: NSLayoutConstraint?
    var notificationRightAnchorOnly : NSLayoutConstraint?
    
    var contactImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "contact")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = CGRect(x: 160, y: 160, width: 35, height: 35)
        imageView.layer.cornerRadius = 0.5 * imageView.bounds.size.width
        imageView.clipsToBounds = true
        //        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Mo salah started following you 9min hhahahahahahahahhahahahhahahhahahhahhahahahhahahahaha"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        
        return button
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(contactImage)
        addSubview(notificationLabel)
        addSubview(followButton)
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        contactImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        contactImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        notificationLabel.leftAnchor.constraint(equalTo: contactImage.rightAnchor, constant: 6).isActive = true
        notificationLabel.centerYAnchor.constraint(equalTo: contactImage.centerYAnchor).isActive = true
        
        notificationRightAnchorWithFollowButton =  notificationLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -15)
//        notificationRightAnchorWithFollowButton?.isActive = true
        
        notificationRightAnchorOnly = notificationLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15)
        
        notificationLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        
        myMutableString = NSMutableAttributedString(string: notificationLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Helvetica Neue", size: 14.0)])
        myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.lightGray, range: NSRange(location:8 ,length:22))
        notificationLabel.attributedText = myMutableString
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        followButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
