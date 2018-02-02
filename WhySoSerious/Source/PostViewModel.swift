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

}
