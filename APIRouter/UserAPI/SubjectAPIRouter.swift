//
//  SubjectAPIRouter.swift
//  APIRouter
//
//  Created by Naver on 2018. 1. 16..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation

public enum SubjectAPIRouter: APIRouter {

    case getSubject(String)
    case getSubjectList(Int, Int)

    public var endPoint: EndPoint {
        switch self {
        case .getSubject(let today):
            return EndPoint(path: "/subject/\(today)", method: .get)
        case .getSubjectList:
            return EndPoint(path: "/subject", method: .get)
        }
    }

    public var headers: HTTPHeaders? {
        switch self {
        case .getSubject, .getSubjectList:
            return nil
        }
    }

    public var parameters: Parameters? {
        switch self {
        case .getSubject:
            return nil
        case .getSubjectList(let year, let month):
            return [
                "year": "\(year)",
                "month": "\(month)"
            ]
        }
    }
}
