//
//  UserAPI.swift
//  APIRouter
//
//  Created by 윤민섭 on 2017. 12. 25..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation

public enum UserAPI: API {

    case register(User)
    case getUserInfo(User)

    public var domain: ServerDomain {
        return ServerDomain.dev
    }

    public var endPoint: EndPoint? {
        switch self {
        case .register(let user):
            return EndPoint(path: "/user/register", method: .post, parameters: user.dictionaryRepresentation)
        case .getUserInfo(let user):
            return EndPoint(path: "/user/\(user.id)", method: .get, parameters: user.dictionaryRepresentation)
        }
    }
}
