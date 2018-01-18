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

    var feedPostViewController: FeedPostViewController?

    let viewModel = FeedViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.action.onNext(.fetchSubject(Date().nonSeperateFormat))
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "post" {
            feedPostViewController = segue.destination as? FeedPostViewController
        }
    }
}
