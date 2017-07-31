//
//  SearchResponse.swift
//  Github
//
//  Created by t_nguyen on 2017/07/31.
//  Copyright © 2017年 ga-technologies. All rights reserved.
//  Xử lý data trả về 

import Foundation
struct SearchResponse<Item: JSONDecodeable> : JSONDecodeable{
    let totalCount: Int
    let items: [Item]
    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JsonDecodeError.invalidFormat(json: json)
        }
        
        guard let totalCount = dictionary["total_count"] as? Int else {
            throw JsonDecodeError.missingValue(key: "total_count", actualValue: dictionary["total_count"])
        }
        
        guard let itemObjects = dictionary["items"] as? [Any] else {
            throw JsonDecodeError.missingValue(key: "items", actualValue: dictionary["items"])
        }
        
        let items = try itemObjects.map {
            return try Item(json: $0)
        }
        
        self.totalCount = totalCount
        self.items = items
    }
}
