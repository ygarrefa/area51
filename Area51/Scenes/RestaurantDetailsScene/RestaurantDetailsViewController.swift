//
//  RestaurantDetailsViewController.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!

    let viewModel: RestaurantDetailsViewModelProtocol

    init(
        nibName nibNameOrNil: String? = nil,
        bundle nibBundleOrNil: Bundle? = nil,
        viewModel: RestaurantDetailsViewModelProtocol) {

        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        title = viewModel.name
        addressLabel.text = viewModel.address
        categoriesLabel.text = viewModel.categories
        distanceLabel.text = viewModel.distance
    }

}
