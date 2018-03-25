//
//  AddExperienceCollectionViewCell.swift
//  TravelProj
//
//  Created by khaled omar on 2/21/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class AddExperienceCollectionViewCell: UICollectionViewCell {
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "download")
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.cornerRadius = 20
//        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        addSubview(titleLabel)
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
//        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor)
        
        profileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        titleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    
    
    
    
    
}
