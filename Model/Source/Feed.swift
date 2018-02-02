//
//  Feed.swift
//  Model
//
//  Created by 윤민섭 on 2018. 1. 17..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation

public struct Author: Codable {

    public var id: Int
    public var nickname: String
    public var bias: UserBias
    public var introduce: String
    public var createDate: String
}

extension Author {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nickname = "nickname"
        case bias = "bias"
        case introduce = "introduce"
        case createDate = "createdAt"
    }
}

public struct FeedSubject: Codable {

    public var id: Int
    public var title: String
    public var createDate: String
    public var publishedDate: String
}

extension FeedSubject {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case createDate = "createdAt"
        case publishedDate = "publishedAt"
    }
}

public struct Feed: Codable {

    public var id: Int
    public var author: Author
    public var subject: FeedSubject
    public var title: String
    public var contents: String
    public var subjectReaction: Reaction
    public var agreeCount: Int
    public var neutralCount: Int
    public var disagreeCount: Int
    public var myReaction: Reaction
    public var createdAt: String
}

extension Feed {

    // swiftlint:disable redundant_string_enum_value
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case subject = "subject"
        case title = "title"
        case contents = "contents"
        case subjectReaction = "subjectReaction"
        case agreeCount = "agreeCount"
        case neutralCount = "neutralCount"
        case disagreeCount = "disagreeCount"
        case myReaction = "myReaction"
        case createdAt = "createdAt"
    }
}
