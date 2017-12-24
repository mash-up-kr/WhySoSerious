//
//  APIRouter.swift
//  APIRouter
//
//  Created by 윤민섭 on 2017. 12. 15..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation

public enum ServerDomain: String {

    case dev = "http://172.20.10.10:8080"
    case real = "http://172.20.10.10:8081"
}

public protocol API {

    var domain: ServerDomain { get }
    var endPoint: EndPoint? { get }
}
