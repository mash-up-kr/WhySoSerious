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

struct NetworkRequestor {

    private static let manager = Alamofire.SessionManager.default

    typealias Completion = ((JSON?, Error?) -> Void)?
    static func request(_ api: API, completion: Completion) {
        manager.session.configuration.timeoutIntervalForRequest = 15
        let endPoint = api.endPoint ?? EndPoint()
        let url = api.domain.rawValue + endPoint.path
        manager.request(url, method: endPoint.method, parameters: endPoint.parameters, encoding: JSONEncoding.default, headers: endPoint.headers).responseJSON { response in
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
