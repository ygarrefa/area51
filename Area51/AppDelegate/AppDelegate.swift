//
//  AppDelegate.swift
//  Area51
//
//  Created by Alexandre Garrefa on 20/02/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {

        let mainViewController = GPSPermissionViewControllerFactory
            .assemble()
            .navigationControllerEmbedded()

        window = MainWindowBuilder()
            .createAppWindow()
            .setAppRootViewController(mainViewController)
            .makeKeyAndVisible()

        return true
    }

}
