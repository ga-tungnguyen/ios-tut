//
//  Repository.swift
//  Github
//
//  Created by t_nguyen on 2017/07/31.
//  Copyright © 2017年 ga-technologies. All rights reserved.
//

import Foundation
struct Repository: JSONDecodeable {
    let nameRepo: String
    let fullName: String
    let stargazersCount: Int
    let language: String
    
    // phải implement lại method init trong JSONDecodeable
    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            //ném ra ngoại lệ ở đây
            throw JsonDecodeError.invalidFormat(json: json)
        }
        
        guard let name = dictionary["name"] as? String else {
            throw JsonDecodeError.missingValue(key: "name", actualValue: dictionary["name"])
        }
        
        guard let fullNameRepo = dictionary["full_name"] as? String else {
            throw JsonDecodeError.missingValue(key: "full_name", actualValue: dictionary["full_name"])
        }
        
        guard let starCount = dictionary["stargazers_count"] as? Int else {
            throw JsonDecodeError.missingValue(key: "stargazers_count", actualValue: dictionary["stargazers_count"])
        }
        guard let repoLanguage = dictionary["language"] as? String else {
            throw JsonDecodeError.missingValue(key: "language", actualValue: dictionary["language"])
        }
        
        self.nameRepo = name
        self.fullName = fullNameRepo
        self.stargazersCount = starCount
        self.language = repoLanguage
    }
}
