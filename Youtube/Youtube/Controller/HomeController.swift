//
//  ViewController.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 31/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

//    var videos: [Video] = {
//
//        var thisChannel = Channel()
//        thisChannel.profileName = "gmm"
//        thisChannel.name = "gmm"
//
//        var dimond = Video()
//
//        dimond.title = "DIAMOND MQT - GUCCI BELT ft. YOUNGOHM ,FIIXD ,YOUNGGU (Prod. by SIXKY!)[Official MV]"
//        dimond.thumnailImage = "gucci-belt"
//        dimond.channel = thisChannel
//        dimond.numberOfViews = 41111289
//
//
//
//        var gmm100x100 = Video()
//
//        gmm100x100.title = "[100x100] อ้ายพามา เขาพาไป (Collab Version) - OG-ANIC x ลำเพลิน วงศกร [Official MV]"
//        gmm100x100.thumnailImage = "100x100"
//        gmm100x100.channel = thisChannel
//        gmm100x100.numberOfViews = 123032492
//
//        return [dimond, gmm100x100]
//    }()
    
    var videos: [Video]?
    
    func fetchVideo() {
        guard let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
    
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                self.videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImage = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let chennel = Channel()
                    chennel.name = channelDictionary["name"] as? String
                    chennel.profileName = channelDictionary["profile_image_name"] as? String
                    
                    video.channel = chennel
                    
                    self.videos?.append(video)
        
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
              
                
            } catch {
                print(error)
            }
            
            
            
            
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchVideo()
        
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
    
    lazy var settingsLauncher: SettingLauncher = {
        let settingsLanucher = SettingLauncher()
        settingsLanucher.homeController = self
        return settingsLanucher
    }()
    
    @objc func moreHandle() {
        // show menu
        settingsLauncher.ShowSetting()
    }
    
    func showControllerForSettings(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.title = setting.name.rawValue
        dummySettingsViewController.view.backgroundColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
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
        return videos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! VideoCell
        
        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

