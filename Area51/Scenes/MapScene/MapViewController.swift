//
//  ViewController.swift
//  Area51
//
//  Created by Alexandre Garrefa on 20/02/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    private var startLocation: Location?
    private var viewModel: MapViewControllerViewModelProtocol

    init(
        nibName nibNameOrNil: String? = nil,
        bundle nibBundleOrNil: Bundle? = nil,
        startLocation: Location?,
        viewModel: MapViewControllerViewModelProtocol) {

        self.startLocation = startLocation
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurants"
        mapView.delegate = self
        mapView.showsUserLocation = true

        if let location = startLocation {
            // Dont use magic numbers in production apps :)
            let region = MKCoordinateRegion(
                center: location.asCLLocationCoordinate2D,
                latitudinalMeters: 500,
                longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
        viewModel.updateRestaurantsCallback = updateRestaurants
    }

    private func updateRestaurants(_ restaurants: [Restaurant]) {
        let annotations = restaurants.map { restaurant -> MKAnnotation in
            RestaurantToAnnotationAdapter.annotation(for: restaurant)
        }
        mapView.addAnnotations(annotations)
    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(
        _ mapView: MKMapView,
        regionDidChangeAnimated animated: Bool) {

        let coordinate = mapView.region.center
        viewModel.visibleAreaDidChangeTo(
            lat: coordinate.latitude,
            lon: coordinate.longitude)
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MapAnnotation else { return }
        let optionalRestaurant = viewModel.restaurants.first { restaurant -> Bool in
            restaurant.id == annotation.id
        }
        guard let restaurant = optionalRestaurant else { return }
        let restaurantDetailsViewController =
            RestaurantDetailsViewControllerFactory.assemble(with: restaurant)
        navigationController?.pushViewController(
            restaurantDetailsViewController,
            animated: true)
    }
}
