//
//  UIViewController+Embedded.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import UIKit

extension UIViewController {
    func navigationControllerEmbedded() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
