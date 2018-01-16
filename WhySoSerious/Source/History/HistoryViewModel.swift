//
//  HistoryViewModel.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Model

struct SectionOfHistory {
    var items: [Item]
}

extension SectionOfHistory: SectionModelType {
    typealias Item = Subject

    init(original: SectionOfHistory, items: [Subject]) {
        self = original
        self.items = items
    }
}

class HistoryViewModel {

    enum Action {
        case fetchSubjectList(Int, Int)
    }

    var action = PublishSubject<Action>()
    var sections = Variable<[SectionOfHistory]>([])

    let disposeBag = DisposeBag()

    init() {
        action
            .subscribe(onNext: { [weak self] event in
                self?.transform(action: event)
            })
            .disposed(by: disposeBag)
    }

    func transform(action: Action) {
        switch action {
        case .fetchSubjectList(let year, let month):
            ServiceProvider.default.apiService
                .fetchSubjectList(year: year, month: month)
                .map { [SectionOfHistory(items: $0)] }
                .bind(to: sections)
                .disposed(by: disposeBag)
        }
    }
}
