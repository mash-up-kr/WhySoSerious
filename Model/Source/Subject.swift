//
//  Subject.swift
//  Model
//
//  Created by Naver on 2018. 1. 16..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation

public struct Subject: Codable {

    public var id: Int
    public var title: String
    public var createDate: String
    public var publishedDate: String
}

extension Subject {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case createDate = "createdAt"
        case publishedDate = "publishedAt"
    }
}
