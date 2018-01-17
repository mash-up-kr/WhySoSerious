//
//  PostAPI.swift
//  WhySoSerious
//
//  Created by 윤민섭 on 2018. 1. 17..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation
import RxSwift
import Model
import NetworkLayer
import APIRouter

extension APIService {

    func fetchFeedList(subjectId: Int, count: Int, cursor: Int) -> Observable<[Post]> {
        return Observable.create { observer -> Disposable in
            NetworkRequestor.request(FeedAPIRouter.getFeed(subjectId, count, cursor)) { json, error in
                if let error = error {
                    observer.onError(error)
                }
                do {
                    print(json)
//                    let jsonString = json?["datas"].description ?? ""
//                    let jsonData = jsonString.data(using: .utf8) ?? Data()
//                    let posts = try JSONDecoder().decode([Post].self, from: jsonData)
                    let posts: [Post] = []
                    observer.onNext(posts)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
