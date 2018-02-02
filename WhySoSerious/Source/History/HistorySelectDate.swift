//
//  HistorySelectDate.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 2. 2..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HistorySelectDateViewController: BaseViewController {

    @IBOutlet weak fileprivate var submitButton: UIButton!

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.rx.tap
            .subscribe { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
    }
}
