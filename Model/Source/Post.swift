//
//  Post.swift
//  Model
//
//  Created by 윤민섭 on 2018. 1. 17..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation

public struct Post: Codable {

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

    public init(id: Int, author: Author, subject: FeedSubject, title: String, contents: String, subjectReaction: Reaction, agreeCount: Int, neutralCount: Int, disagreeCount: Int, myReaction: Reaction, createdAt: String) {
        self.id = id
        self.author = author
        self.subject = subject
        self.title = title
        self.contents = contents
        self.subjectReaction = subjectReaction
        self.agreeCount = agreeCount
        self.neutralCount = neutralCount
        self.disagreeCount = disagreeCount
        self.myReaction = myReaction
        self.createdAt = createdAt
    }
}

extension Post {

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

public enum Reaction: String, Codable {
    case none
    case agree = "AGREE"
    case disagree = "DISAGREE"
    case neutral = "NEUTRAL"

    public var reactionBoxImage: UIImage? {
        switch self {
        case .agree: return #imageLiteral(resourceName: "02BoxAgree")
        case .disagree: return #imageLiteral(resourceName: "02BoxDisagree")
        case .neutral: return #imageLiteral(resourceName: "02BoxAgreeCopy")
        default: return nil
        }
    }

    public var reactionNormalImage: UIImage? {
        switch self {
        case .agree: return #imageLiteral(resourceName: "02ReactDefault1")
        case .disagree: return #imageLiteral(resourceName: "02ReactDefault2")
        case .neutral: return #imageLiteral(resourceName: "02ReactDefault3")
        default: return nil
        }
    }

    public var reactionActiveImage: UIImage? {
        switch self {
        case .agree: return #imageLiteral(resourceName: "02ReactAct1")
        case .disagree: return #imageLiteral(resourceName: "02ReactAct2")
        case .neutral: return #imageLiteral(resourceName: "02ReactAct3")
        default: return nil
        }
    }
}
