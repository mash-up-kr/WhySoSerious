//
//  User.swift
//  APIRouter
//
//  Created by 윤민섭 on 2017. 12. 25..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation

public struct User: Codable {

    public var uuid: String
    public var id: Int
    public var nickname: String
    public var age: Int
    public var gender: Gender
    public var bias: UserBias
    public var introduce: String
}

extension User {

    // swiftlint:disable redundant_string_enum_value
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case id = "id"
        case nickname = "nickname"
        case age = "age"
        case gender = "gender"
        case bias = "bias"
        case introduce = "introduce"
    }
}

public enum Gender: String, Codable {

    case male
    case female
}

extension Gender: RawRepresentable {

    public init?(rawValue: String) {
        switch rawValue {
        case "MALE":
            self = .male
        case "FEMALE":
            self = .female
        default: return nil
        }
    }

    public var rawValue: String {
        switch self {
        case .male:
            return "MALE"
        case .female:
            return "FEMALE"
        }
    }
}

public enum UserBias: String, Codable {

    case blue
    case skyblue
    case mid
    case orange
    case red

    public var smallFace: UIImage {
        switch self {
        case .blue: return #imageLiteral(resourceName: "02FaceBlue")
        case .skyblue: return #imageLiteral(resourceName: "02FaceSky")
        case .mid: return #imageLiteral(resourceName: "02FaceMarin")
        case .orange: return #imageLiteral(resourceName: "02FaceOrange")
        case .red: return #imageLiteral(resourceName: "02FaceRed")
        }
    }
}

extension UserBias: RawRepresentable {

    public init?(rawValue: String) {
        switch rawValue {
        case "EXTREME_LEFT":
            self = .blue
        case "LEFT":
            self = .skyblue
        case "MID":
            self = .mid
        case "RIGHT":
            self = .orange
        case "EXTREME_RIGHT":
            self = .red
        default: return nil
        }
    }

    public var rawValue: String {
        switch self {
        case .blue:
            return "EXTREME_LEFT"
        case .skyblue:
            return "LEFT"
        case .mid:
            return "MID"
        case .orange:
            return "RIGHT"
        case .red:
            return "EXTREME_RIGHT"
        }
    }
}
