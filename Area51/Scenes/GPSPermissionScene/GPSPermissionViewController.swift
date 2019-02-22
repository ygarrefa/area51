//
//  GPSPermissionViewController.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import UIKit

class GPSPermissionViewController: UIViewController {

    private var viewModel: GPSPermissionViewModelProtocol

    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    init(
        nibName nibNameOrNil: String? = nil,
        bundle nibBundleOrNil: Bundle? = nil,
        viewModel: GPSPermissionViewModelProtocol) {

        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Area51 Restaurants"
        viewModel.locationUpdated = { [weak self] location in
            guard let self = self else { return }
            self.startWithUserLocation(location)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let gpsPermissionAlreadyRequested =
            viewModel.gpsPermissionAlreadyRequested

        infoLabel.isHidden = gpsPermissionAlreadyRequested
        continueButton.isHidden = gpsPermissionAlreadyRequested
        if gpsPermissionAlreadyRequested {
            spinner.startAnimating()
            viewModel.getUserLocation()
        }
    }

    @IBAction private func continueButtonPressed() {
        viewModel.requestGPSPermission()

        guard viewModel.isLocationServicesEnabled else {
            startWithUserLocation(nil)
            return
        }

        viewModel.getUserLocation()
    }

    private func startWithUserLocation(_ location: Location?) {
        let nextViewController = MapViewControllerFactory.assemble(with: location)
        navigationController?.viewControllers = [nextViewController]
    }
}
