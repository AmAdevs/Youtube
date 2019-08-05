//
//  SettingLauncher.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 5/8/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class SettingLauncher: NSObject {
    override init() {
        super.init()
        ShowSetting()
    }
    
    let blackView = UIView()
    
    @objc func ShowSetting() {
        // show menu
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
            
        }
        
    }
    
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    
}
