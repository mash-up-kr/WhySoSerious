//
//  HomeViewController.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Model

class FeedViewController: BaseViewController {

    // swiftlint:disable implicitly_unwrapped_optional
    var feedPostViewController: FeedPostViewController!

    let viewModel = FeedViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.action.onNext(.fetchSubject(Date().nonSeperateFormat))

        viewModel.subject
            .asObservable()
            .map { $0?.title }
            .bind(to: feedPostViewController.todaySubjectLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.subject
            .asObservable()
            .map { $0?.id ?? 11 }
            .subscribe(onNext: { [weak self] id in
                self?.feedPostViewController.fetch(subjectID: id)
            })
            .disposed(by: disposeBag)

        navigationController?.navigationBar.layer.rx.observe(CGRect.self, "bounds")
            .map(updateTitle(at: ))
            .subscribe(onNext: { [weak self] title in
                self?.navigationItem.title = title
            })
            .disposed(by: disposeBag)

    }

    func updateTitle(at rect: CGRect?) -> String? {
        let smallNavigationBarHeight: CGFloat = 44
        if (rect?.height ?? 0) <= smallNavigationBarHeight {
            return "\"\(viewModel.subject.value?.title ?? "")\""
        } else {
            return "피드"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "post" {
            feedPostViewController = segue.destination as? FeedPostViewController
        }
    }
}
