//
//  TutorialViewController.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 2. 3..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet fileprivate weak var 스크롤뷰: UIScrollView!
    @IBOutlet fileprivate weak var 아이폰6용컨텐츠뷰: UIView!

    override var shouldAutorotate: Bool {
        return presentingViewController?.shouldAutorotate ?? false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return presentingViewController?.supportedInterfaceOrientations ?? .portrait
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        스크롤뷰.addSubview(아이폰6용컨텐츠뷰)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let 스크롤컨텐츠뷰 = 스크롤뷰.subviews.first {
            스크롤컨텐츠뷰.frame.size.width = 스크롤뷰.bounds.width * 5
            스크롤컨텐츠뷰.frame.size.height = 스크롤뷰.bounds.height
            스크롤뷰.contentSize = 스크롤컨텐츠뷰.frame.size
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    @IBAction private func 닫기(_ sender: UIButton) {
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        UIApplication.shared.delegate?.window??.rootViewController = tabBarController
//        dismiss(animated: false) {
//        }
    }
}
