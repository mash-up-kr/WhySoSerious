//
//  UserAPI.swift
//  APIRouter
//
//  Created by 윤민섭 on 2017. 12. 25..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation
import Model

public enum UserAPIRouter: APIRouter {

    case register(User)
    case getUserInfo(User)

    public var endPoint: EndPoint {
        switch self {
        case .register:
            return EndPoint(path: "/user/register", method: .post)
        case .getUserInfo(let user):
            return EndPoint(path: "/user/\(user.id)", method: .post)
        }
    }

    public var headers: HTTPHeaders? {
        switch self {
        case .register:
            return nil
        case .getUserInfo:
            return nil
        }
    }

    public var parameters: Parameters? {
        switch self {
        case .register(let user), .getUserInfo(let user):
            return [
                "uuid": user.uuid,
                "id": user.id,
                "nickname": user.nickname,
                "age": user.age,
                "bias": user.bias,
                "introduce": user.introduce,
                "gender": user.gender
            ]
        }
    }
}
