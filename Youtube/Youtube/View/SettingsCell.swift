//
//  SettingsCell.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 6/8/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class SettingsCell: BaseCell {
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Setting"
        return nameLabel
    }()
    
    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = #imageLiteral(resourceName: "settings")
        iconImageView.contentMode = .scaleAspectFill
        return iconImageView
    }()
    
    
    override func setUpViews() {
        super.setUpViews()

        addSubview(nameLabel)
        addSubview(iconImageView)
        
        addConstraintWithFormat(format: "H:|-8-[v0(30)]-0-[v1]|", views: iconImageView, nameLabel)
        addConstraintWithFormat(format: "V:|[v0]|", views: nameLabel)
        
        addConstraintWithFormat(format: "V:[v0(30)]", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}
