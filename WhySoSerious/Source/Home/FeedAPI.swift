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

    func fetchFeedList(subjectId: Int, count: Int, cursor: Int) -> Observable<Feed> {
        print(subjectId)
        return Observable.create { observer -> Disposable in
            NetworkRequestor.request(FeedAPIRouter.getFeed(subjectId, count, cursor)) { json, error in
                if let error = error {
                    observer.onError(error)
                }
                do {
                    let jsonString = json?["datas"].description ?? ""
                    let jsonData = jsonString.data(using: .utf8) ?? Data()
                    let feed = try JSONDecoder().decode(Feed.self, from: jsonData)
                    observer.onNext(feed)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }

    func fetchSubject(today: String) -> Observable<Subject> {
        return Observable.create { observer -> Disposable in
            NetworkRequestor.request(SubjectAPIRouter.getSubject(today)) { json, error in
                if let error = error {
                    observer.onError(error)
                }
                do {
                    let jsonString = json?.description ?? ""
                    let jsonData = jsonString.data(using: .utf8) ?? Data()
                    let subject = try JSONDecoder().decode(Subject.self, from: jsonData)
                    observer.onNext(subject)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
