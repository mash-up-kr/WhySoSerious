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
    let age: Int?
    let gender: Gender?
    let bias: UserBias
    let introduce: String?

    var dictionaryRepresentation: [String: Any] {
        return [
            "uuid": uuid,
            "id": id,
            "nickname": nickname,
            "age": age ?? 0,
            "bias": bias.rawValue,
            "introduce": introduce ?? "",
            "gender": gender?.rawValue ?? ""
        ]
    }
}

enum Gender: String {

    case MALE
    case FEMALE

    init?(rawValue: String) {
        switch rawValue {
        case "MALE":
            self = .MALE
        case "FEMALE":
            self = .FEMALE
        default: return nil
        }
    }
}

enum UserBias: String {

    case BLUE = "EXTREME_LEFT"
    case SKYBLUE = "LEFT"
    case MID = "MID"
    case ORANGE = "RIGHT"
    case RED = "EXTREME_RIGHT"

    init?(rawValue: String) {
        switch rawValue {
        case "EXTREME_LEFT":
            self = .BLUE
        case "LEFT":
            self = .SKYBLUE
        case "MID":
            self = .MID
        case "RIGHT":
            self = .ORANGE
        case "EXTREME_RIGHT":
            self = .RED
        default: return nil
        }
    }
}
