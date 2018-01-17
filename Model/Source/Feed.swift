//
//  Feed.swift
//  Model
//
//  Created by 윤민섭 on 2018. 1. 17..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation

public struct Feed: Codable {

    public var cursor: Int
    public var totalCount: Int
    public var posts: [Post]
}

extension Feed {

    // swiftlint:disable redundant_string_enum_value
    enum CodingKeys: String, CodingKey {
        case cursor = "cursor"
        case totalCount = "totalCount"
        case posts = "data"
    }
}
