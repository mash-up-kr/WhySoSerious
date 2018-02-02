//
//  BaseTabBarController.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit

enum TabBarItem: String {
    case home
    case history
    case write
    case bell
    case my
}

extension TabBarItem: RawRepresentable {

    public init?(rawValue: String) {
        switch rawValue {
        case "홈":
            self = .home
        case "히스토리":
            self = .history
        case "작성하기":
            self = .write
        case "알림":
            self = .bell
        case "마이페이지":
            self = .my
        default: return nil
        }
    }

    public var rawValue: String {
        switch self {
        case .home:
            return "홈"
        case .history:
            return "히스토리"
        case .write:
            return "작성하기"
        case .bell:
            return "알림"
        case .my:
            return "마이페이지"
        }
    }
}

class BaseTabBarController: UITabBarController {

    var previousIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(moveBeforeWrite), name: NSNotification.Name("moveBeforeWrite"), object: nil)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tabBarItem = TabBarItem(rawValue: item.title ?? "홈") ?? .home
        switch tabBarItem {
        case .home, .history, .bell, .my:
            previousIndex = item.tag
        case .write:
            if let vc = viewControllers {
                if let nv = vc[item.tag] as? BaseNavigationController {
                    if let wc = nv.topViewController as?
                        WriteViewController {
                        wc.performSegue(withIdentifier: "popWrite", sender: self)
                    }
                }
            }
        }
    }

    @objc
    func moveBeforeWrite() {
        self.selectedIndex = previousIndex
    }
}
