//
//  Video.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 1/8/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumnailImage: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    
    var name: String?
    var profileName: String?
    
}
