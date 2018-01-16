//
//  BaseNavigationController.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseNavigationController: UINavigationController {

    var largeTitle: String?
    var smallTitle: String?

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = true
        navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBar.tintColor = #colorLiteral(red: 0.1450980392, green: 0.1882352941, blue: 0.2470588235, alpha: 1)
        navigationBar.shadowImage = UIImage.image(with: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        navigationBar.layoutMargins = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)

        navigationBar.layer.rx.observe(CGRect.self, "bounds")
            .map(updateTitle(at: ))
            .subscribe(onNext: { [weak self] title in
                self?.navigationItem.title = title
            })
            .disposed(by: disposeBag)
    }

    func updateTitle(at rect: CGRect?) -> String? {
        let smallNavigationBarHeight: CGFloat = 44
        if (rect?.height ?? 0) <= smallNavigationBarHeight {
            return smallTitle
        } else {
            return largeTitle
        }
    }
}
