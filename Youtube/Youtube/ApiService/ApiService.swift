//
//  ApiService.swift
//  Youtube
//
//  Created by Ananchai Mankhong on 7/8/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    static let shareInstance = ApiService()
    
    func fetchVideo(completion: @escaping ([Video]) -> ()) {
        guard let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                var videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImage = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let chennel = Channel()
                    chennel.name = channelDictionary["name"] as? String
                    chennel.profileName = channelDictionary["profile_image_name"] as? String
                    
                    video.channel = chennel
                    
                    videos.append(video)
                    
                }
                
                DispatchQueue.main.async {
                    completion(videos)
                }
                
                
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
