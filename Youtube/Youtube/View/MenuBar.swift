//
//  MenuBar.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 1/8/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
