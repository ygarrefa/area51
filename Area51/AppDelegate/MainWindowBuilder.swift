//
//  MainWindowBuilder.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import UIKit

class MainWindowBuilder: NSObject {

    var window: UIWindow?

    func createAppWindow() -> MainWindowBuilder {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .black
        return self
    }

    func setAppRootViewController(
        _ viewController: UIViewController) -> MainWindowBuilder {
        window?.rootViewController = viewController
        return self
    }

    func makeKeyAndVisible() -> UIWindow? {
        window?.makeKeyAndVisible()
        return window
    }
}
