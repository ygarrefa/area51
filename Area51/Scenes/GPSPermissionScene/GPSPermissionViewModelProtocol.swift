//
//  GPSPermissionViewModelProtocol.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

protocol GPSPermissionViewModelProtocol {
    var locationUpdated: (Location?) -> Void { get set }
    var isLocationServicesEnabled: Bool { get }
    var gpsPermissionAlreadyRequested: Bool { get }

    func requestGPSPermission()
    func getUserLocation()
}
