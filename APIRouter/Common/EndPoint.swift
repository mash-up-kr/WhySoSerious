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

    public var path: String
    public var method: HTTPMethod

    public init(path: String = "", method: HTTPMethod = .get) {
        self.path = path
        self.method = method
    }
}
