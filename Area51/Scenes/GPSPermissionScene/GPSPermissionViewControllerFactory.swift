//
//  GPSPermissionViewControllerFactory.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

struct GPSPermissionViewControllerFactory {
    static func assemble() -> GPSPermissionViewController {
        return GPSPermissionViewController(viewModel: GPSPermissionViewModel())
    }
}
