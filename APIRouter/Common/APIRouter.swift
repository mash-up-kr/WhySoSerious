//
//  APIRouter.swift
//  APIRouter
//
//  Created by 윤민섭 on 2017. 12. 15..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation
import Alamofire

public enum ServerBaseUrl: String {

    case dev = "http://ec2-13-124-163-166.ap-northeast-2.compute.amazonaws.com:8080"
    case real = "http://172.20.10.10:8081"
}

public protocol APIRouter {

    typealias Parameters = [String: Any]
    typealias HTTPHeaders = [String: String]

    var endPoint: EndPoint { get }

    var headers: HTTPHeaders? { get }

    var parameters: Parameters? { get }
}

public extension APIRouter {

    var requestUrl: String {
        return baseUrl.rawValue + endPoint.path
    }

    var baseUrl: ServerBaseUrl {
        return .dev
    }
}
