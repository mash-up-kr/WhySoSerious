//
//  SplashViewController.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 2. 2..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation
import Lottie

class SplashViewController: UIViewController {

    private var splashLottieAnimationView = LOTAnimationView(name: "splash_last")

    override func viewDidLoad() {
        super.viewDidLoad()
        splashLottieAnimationView.frame = CGRect(x: 35, y: 160, width: 300, height: 300)
        view.addSubview(splashLottieAnimationView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        splashLottieAnimationView.play { _ in
            let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            UIApplication.shared.delegate?.window??.rootViewController = tabBarController
        }
    }
}
