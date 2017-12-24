//
//  AppDelegate.swift
//  WhySoSerious
//
//  Created by Naver on 2017. 12. 10..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import UIKit
import Logger
import Firebase
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupLogger()
        logger.info()
        FirebaseApp.configure()
        Fabric.with([Crashlytics.self])
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        logger.info()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        logger.info()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        logger.info()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        logger.info()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        logger.info()
    }
}
