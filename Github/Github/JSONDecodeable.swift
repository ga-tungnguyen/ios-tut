//
//  JSONDecodeable.swift
//  Github
//
//  Created by t_nguyen on 2017/07/31.
//  Copyright © 2017年 ga-technologies. All rights reserved.
//  Dùng để decode JSON là một protocol giống như interface trong java


import Foundation
protocol JSONDecodeable {
    init(json: Any) throws // ném ra ngoại lệ nào đó
}
