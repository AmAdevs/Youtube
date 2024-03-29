//
//  VideoCell.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 31/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell {

    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            
            setupThumbnailImage()
            setupProfileImage()
            if let channelName = video?.channel?.name, let numberOfviews = video?.numberOfViews {
                   
                    
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                    
                let subText = "\(channelName) ∙ \(numberFormatter.string(from: numberOfviews) ?? "") ∙ 1 years ago"
                subTitleTextView.text = subText

            }
                
        
            
            // measure title text
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 44
                } else {
                    titleLabelHeightConstraint?.constant = 20
                }
                
            }
          
        }
    }
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profileName {
            userProfileImage.loadImageUsingUrlString(urlString: profileImageUrl)
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageUrl = video?.thumbnailImage  {
            thumbnilImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
        }
    }
    
    
    let thumbnilImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "gucci-belt")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImage: CustomImageView = {
        let userImageView = CustomImageView()
        userImageView.image = UIImage(named: "diamond")
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = 44/2
        return userImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "DIAMOND MQT - GUCCI BELT ft. YOUNGOHM ,FIIXD ,YOUNGGU (Prod. by SIXKY!)[Official MV]"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    let subTitleTextView: UITextView = {
        let subTitleTextView = UITextView()
        subTitleTextView.text = "41,111,189 views"
        subTitleTextView.textColor = UIColor.gray
        subTitleTextView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        subTitleTextView.translatesAutoresizingMaskIntoConstraints = false
        return subTitleTextView
    }()
    
    let separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return separator
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setUpViews() {
        addSubview(thumbnilImageView)
        addSubview(separatorView)
        addSubview(userProfileImage)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnilImageView)
        addConstraintWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImage)
        
        // Vertical constraint
        addConstraintWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-28-[v2(1)]-|", views: thumbnilImageView, userProfileImage ,separatorView )
        addConstraintWithFormat(format:  "H:|[v0]|", views: separatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnilImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 5))
        
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImage, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImage, attribute: .right, multiplier: 1, constant: 8))
        
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnilImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        
        //height constraint
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //        addConstraintWithFormat(format: "V:[v0(20)]", views: titleLabel)
        //        addConstraintWithFormat(format: "H:|[v0]|", views: titleLabel)
        
    }
    
   
}




