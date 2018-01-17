//
//  HistoryAPI.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 16..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation
import RxSwift
import Model
import NetworkLayer
import APIRouter

extension APIService {

    func fetchSubjectList(year: Int, month: Int) -> Observable<[Subject]> {
        return Observable.create { observer -> Disposable in
            NetworkRequestor.request(SubjectAPIRouter.getSubjectList(year, month)) { json, error in
                if let error = error {
                    observer.onError(error)
                }
                do {
                    let jsonString = json?["datas"].description ?? ""
                    let jsonData = jsonString.data(using: .utf8) ?? Data()
                    let subjects = try JSONDecoder().decode([Subject].self, from: jsonData)
                    observer.onNext(subjects)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
