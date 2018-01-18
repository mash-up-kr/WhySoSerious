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

    func fetchFeedList(subjectId: Int, count: Int, cursor: Int, completion: @escaping (Feed) -> Void) {

        NetworkRequestor.request(FeedAPIRouter.getFeed(subjectId, count, cursor)) { json, error in

            if error != nil {
                print("error in \(#function)")
                return
            }
            print(json)
            do {
                let jsonString = json?["datas"].description ?? ""
                let jsonData = jsonString.data(using: .utf8) ?? Data()
                let feed = try JSONDecoder().decode(Feed.self, from: jsonData)
                completion(feed)
            } catch {
                print("error in \(#function)")
            }
        }
    }

    func fetchSubject(today: String, completion: @escaping (Subject) -> Void) {

        NetworkRequestor.request(SubjectAPIRouter.getSubject(today)) { json, error in

            if error != nil {
                print("error in \(#function)")
                return
            }
            print(json)
            do {
                let jsonString = json?["datas"].description ?? ""
                let jsonData = jsonString.data(using: .utf8) ?? Data()
                let subject = try JSONDecoder().decode(Subject.self, from: jsonData)
                completion(subject)
            } catch {
                print("error in \(#function)")
            }
        }
    }
}
