//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by 윤민섭 on 2017. 12. 16..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation
import Alamofire

public struct EndPoint {

    public typealias Parameters = [String: Any]
    public typealias HTTPHeaders = [String: String]

    public var path: String
    public var method: HTTPMethod
    public var parameters: Parameters?
    public var headers: HTTPHeaders?

    public init(path: String = "", method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}
