//
//  JSONDecoceError.swift
//  Github
//
//  Created by t_nguyen on 2017/07/31.
//  Copyright © 2017年 ga-technologies. All rights reserved.
//
// Class này dùng để xử lý lỗi khi get data từ Git về

import Foundation
enum JsonDecodeError: Error {
    case invalidFormat(json: Any)
    case missingValue(key: String, actualValue: Any?)
}
