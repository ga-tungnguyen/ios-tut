//
//  GithubClientError.swift
//  Github
//
//  Created by t_nguyen on 2017/07/31.
//  Copyright © 2017年 ga-technologies. All rights reserved.
//

import Foundation
enum GithubClientError: Error{
    case connectionError(Error)
    case responseParseError(Error)
    case apiError(Error)
}
