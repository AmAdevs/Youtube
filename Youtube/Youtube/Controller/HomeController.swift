//
//  ViewController.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 31/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
        
        var thisChannel = Channel()
        thisChannel.profileName = "gmm"
        thisChannel.name = "gmm"
        
        var dimond = Video()
        
        dimond.title = "DIAMOND MQT - GUCCI BELT ft. YOUNGOHM ,FIIXD ,YOUNGGU (Prod. by SIXKY!)[Official MV]"
        dimond.thumnailImage = "gucci-belt"
        dimond.channel = thisChannel
        dimond.numberOfViews = 41111289
        

        
        var gmm100x100 = Video()
        
        gmm100x100.title = "[100x100] อ้ายพามา เขาพาไป (Collab Version) - OG-ANIC x ลำเพลิน วงศกร [Official MV]"
        gmm100x100.thumnailImage = "100x100"
        gmm100x100.channel = thisChannel
        gmm100x100.numberOfViews = 123032492
        
        return [dimond, gmm100x100]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        collectionView.backgroundColor = .white
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "CellId")
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setUpMenuBar()
        setUpNavbarButton()
    }
    
    func setUpNavbarButton() {
        
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(searchBarHandle))
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(moreHandle))
        
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    
    @objc func searchBarHandle() {
        
    }
    
    @objc func moreHandle() {
        
    }
    
    let menuBar: MenuBar = {
        let menuBar = MenuBar()
        return menuBar
    }()
    
    private func setUpMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat(format: "V:|[v0(50)]", views: menuBar)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

