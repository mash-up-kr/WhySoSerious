//
//  User.swift
//  APIRouter
//
//  Created by 윤민섭 on 2017. 12. 25..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation

public struct User {

    let uuid: String
    let id: Int
    let nickname: String
    let age: Int
    let gender: Gender
    let bias: UserBias
    let introduce: String?

    var dictionaryRepresentation: [String: Any] {
        return [
            "uuid": uuid,
            "id": id,
            "nickname": nickname,
            "age": age,
            "bias": bias.rawValue,
            "introduce": introduce ?? "",
            "gender": gender.rawValue
        ]
    }
}

enum Gender: String {

    case male
    case female
}

extension Gender: RawRepresentable {
   
    init?(rawValue: String) {
        switch rawValue {
        case "MALE":
            self = .male
        case "FEMALE":
            self = .female
        default: return nil
        }
    }
    
    var rawValue: String {
        switch self {
        case .male:
            return "MALE"
        case .female:
            return "FEMALE"
        }
    }
}

enum UserBias: String {

    case blue
    case skyblue
    case mid
    case orange
    case red
}

extension UserBias: RawRepresentable {
    
    init?(rawValue: String) {
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
    
    var rawValue: String {
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
