//
//  BaseViewController.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit

enum NavigationTitleType {
    case large(String?)
    case small(String?)
}

protocol TitleTransformable {
    func updateTitle(type: NavigationTitleType)
}

extension TitleTransformable where Self: BaseViewController {
    func updateTitle(type: NavigationTitleType) {
        switch type {
        case .large(let title):
            (navigationController as? BaseNavigationController)?.largeTitle = title
        case .small(let title):
            (navigationController as? BaseNavigationController)?.smallTitle = title
        }
    }
}

class BaseViewController: UIViewController, TitleTransformable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
