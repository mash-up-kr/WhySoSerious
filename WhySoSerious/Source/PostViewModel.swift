//
//  OpinionViewModel.swift
//  WhySoSerious
//
//  Created by 윤민섭 on 2018. 1. 17..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Model

struct SectionOfPost {
    var items: [Item]
}

extension SectionOfPost: SectionModelType {
    typealias Item = Post

    init(original: SectionOfPost, items: [Post]) {
        self = original
        self.items = items
    }
}

class PostViewModel {

    enum Action {
        case fetchPostList
    }

    var action = PublishSubject<Action>()
    var sections = Variable<[SectionOfPost]>([])
    var fetchAction: (() -> Observable<[Post]>)?

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
        case .fetchPostList:
            fetchAction?()
            .map { [SectionOfPost(items: $0)] }
            .bind(to: sections)
            .disposed(by: disposeBag)
        }
    }
}
