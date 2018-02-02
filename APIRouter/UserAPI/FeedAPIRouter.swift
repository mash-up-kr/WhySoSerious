//
//  FeedAPIRouter.swift
//  APIRouter
//
//  Created by 윤민섭 on 2018. 1. 17..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation

let uuid = "0DDDEA82-4B36-4105-B235-E8CA7F441D28"
public enum FeedAPIRouter: APIRouter {

    case getFeed(Int, Int, Int)

    public var endPoint: EndPoint {
        switch self {
        case .getFeed(let subjectId, _, _):
            return EndPoint(path: "/feed/\(subjectId)", method: .get)
        }
    }

    public var headers: HTTPHeaders? {
        switch self {
        case .getFeed:
            return ["uuid": uuid]
        }
    }

    public var parameters: Parameters? {
        switch self {
        case .getFeed(_, let count, let cursor):
            return [
                "count": count,
                "cursor": cursor
            ]
        }
    }
}
