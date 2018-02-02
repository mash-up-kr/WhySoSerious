//
//  FeedPostViewController.swift
//  WhySoSerious
//
//  Created by Minseob Yoon on 2018. 1. 18..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Model

class FeedPostViewController: PostViewController {

    @IBOutlet weak var todaySubjectLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        ServiceProvider.default.apiService.fetchFeedList(subjectId: 11, count: 15, cursor: 0) { [weak self] feeds in
            var posts: [Post] = []
            feeds.forEach {
                let post = Post(id: $0.id, author: $0.author, subject: $0.subject, title: $0.title, contents: $0.contents, subjectReaction: $0.subjectReaction, agreeCount: $0.agreeCount, neutralCount: $0.neutralCount, disagreeCount: $0.disagreeCount, myReaction: $0.myReaction, createdAt: $0.createdAt)
                posts.append(post)
            }
            self?.posts = posts
        }
    }
}
