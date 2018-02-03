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
    public var agreeCount: Int
    public var disagreeCount: Int
    public var neutralCount: Int

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        title = (try? container.decode(String.self, forKey: .title)) ?? ""
        createDate = (try? container.decode(String.self, forKey: .createDate)) ?? ""
        publishedDate = (try? container.decode(String.self, forKey: .publishedDate)) ?? ""
        agreeCount = (try? container.decode(Int.self, forKey: .agreeCount)) ?? 0
        disagreeCount = (try? container.decode(Int.self, forKey: .disagreeCount)) ?? 0
        neutralCount = (try? container.decode(Int.self, forKey: .neutralCount)) ?? 0
    }
}

extension Subject {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case createDate = "createdAt"
        case publishedDate = "publishedAt"
        case agreeCount = "agreeCount"
        case disagreeCount = "disagreeCount"
        case neutralCount = "neutralCount"
    }
}
