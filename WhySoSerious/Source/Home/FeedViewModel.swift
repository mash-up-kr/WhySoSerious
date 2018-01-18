//
//  HomeViewModel.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Model

class FeedViewModel {

    enum Action {
        case fetchSubject(String)
        case fetchFeedList(Int, Int, Int)
    }

    var action = PublishSubject<Action>()
    let disposeBag = DisposeBag()

    var feed = Variable<Feed?>(nil)
    var subject = Variable<Subject?>(nil)

    init() {
        action
            .subscribe(onNext: { [weak self] event in
                self?.transform(action: event)
            })
            .disposed(by: disposeBag)
    }

    func transform(action: Action) {
        switch action {
        case .fetchFeedList(let subjectId, let count, let cursor):
            ServiceProvider.default.apiService
                .fetchFeedList(subjectId: subjectId, count: count, cursor: cursor)
                .bind(to: feed)
                .disposed(by: disposeBag)
        case .fetchSubject(let today):
            ServiceProvider.default.apiService
                .fetchSubject(today: today)
                .bind(to: subject)
                .disposed(by: disposeBag)
        }
    }
}
