//
//  HomeCellTableViewCell.swift
//  CellTravel
//
//  Created by khaled omar on 2/11/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class HomeCellTableViewCell: UITableViewCell {
    
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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Mo salah"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "3 min ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "download")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "Sub Title"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Giza,Egypt"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "The Egyptian pyramids are ancient pyramid-shaped masonry structures located in Egypt , A. "
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let travelView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 1
        //        view.layer.shadowColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var homeButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "web-page-home (1)")
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        button.layer.cornerRadius = 25 //  0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setTitle("hellooooo", for: .normal)
        
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "commenting")
        button.setImage(image, for: .normal)
        //        button.imageEdgeInsets = ui
        button.setTitle("hellooooo", for: .normal)
        return button
        
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.text = "view more 9 comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ratingButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star")
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "90 voting"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(nameLabel)
        addSubview(timeLabel)
        addSubview(travelView)
        addSubview(profileImageView)
        addSubview(descriptionLabel)
        addSubview(subTitle)
        addSubview(commentButton)
        addSubview(commentLabel)
        addSubview(ratingButton)
        addSubview(ratingLabel)
        addSubview(locationLabel)
        addSubview(homeButton)
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        contactImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        contactImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        nameLabel.leftAnchor.constraint(equalTo: contactImage.rightAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contactImage.centerYAnchor).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: contactImage.centerYAnchor).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        travelView.topAnchor.constraint(equalTo: contactImage.bottomAnchor, constant: 13).isActive = true
        travelView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        travelView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        travelView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        homeButton.topAnchor.constraint(equalTo: travelView.topAnchor, constant: 20).isActive = true
        homeButton.rightAnchor.constraint(equalTo: travelView.rightAnchor, constant: -10).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        profileImageView.leftAnchor.constraint(equalTo: travelView.leftAnchor, constant: 15).isActive = true
        profileImageView.topAnchor.constraint(equalTo: travelView.topAnchor, constant: 20).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        profileImageView.bottomAnchor.constraint(equalTo: ratingButton.topAnchor, constant: -30).isActive = true
//        profileImageView.rightAnchor.constraint(equalTo: subTitle.leftAnchor, constant: -25).isActive = true
        
        // need x,y,width,height anchors
        subTitle.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 25).isActive = true
        subTitle.topAnchor.constraint(lessThanOrEqualTo: travelView.topAnchor, constant: 30).isActive = true
        subTitle.widthAnchor.constraint(equalToConstant: 230).isActive = true
        subTitle.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        // need x,y,width,height anchors
        descriptionLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 25).isActive = true
        descriptionLabel.topAnchor.constraint(lessThanOrEqualTo: locationLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: travelView.rightAnchor, constant: -10).isActive = true
//        descriptionLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // need x,y,width,height anchors
        
        locationLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 25).isActive = true
        locationLabel.topAnchor.constraint(lessThanOrEqualTo: subTitle.bottomAnchor, constant: 3).isActive = true
        locationLabel.widthAnchor.constraint(equalToConstant: 230).isActive = true
        locationLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        commentButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30).isActive = true
        commentButton.rightAnchor.constraint(equalTo: travelView.rightAnchor, constant: -70).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        commentLabel.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 5).isActive = true
        commentLabel.rightAnchor.constraint(equalTo: travelView.rightAnchor, constant: -20).isActive = true
        commentLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        commentLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        ratingButton.bottomAnchor.constraint(equalTo: travelView.bottomAnchor, constant: -30).isActive = true
        ratingButton.leftAnchor.constraint(equalTo: travelView.leftAnchor, constant: 50).isActive = true
        ratingButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ratingButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        ratingLabel.topAnchor.constraint(equalTo: ratingButton.bottomAnchor, constant: 5).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: travelView.leftAnchor, constant: 33).isActive = true
        ratingLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
