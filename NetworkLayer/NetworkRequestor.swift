//
//  Networker.swift
//  NetworkLayer
//
//  Created by 윤민섭 on 2017. 12. 17..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import APIRouter

public struct NetworkRequestor {

    private static let manager = Alamofire.SessionManager.default

    public typealias Completion = ((JSON?, Error?) -> Void)?
    public static func request(_ api: APIRouter, completion: Completion) {
        manager.session.configuration.timeoutIntervalForRequest = 15
        manager.request(api.requestUrl, method: api.endPoint.method, parameters: api.parameters, headers: api.headers).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    let parsedData = JSON(data)
                    completion?(parsedData, nil)
                }
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}
