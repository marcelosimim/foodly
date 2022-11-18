//
//  SearchDetailsViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/10/22.
//

import MapKit
import UIKit

class SearchDetailsViewController: UIViewController {
    private let customView = SearchDetailsView()
    var restaurant: Restaurant?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupMap()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let restaurant = restaurant else { return }
        customView.configure(restaurant: restaurant)
    }

    override func loadView() {
        super.loadView()
        view = customView
        customView.mapView.delegate = self
    }

    func setupMap() {
        guard let latitude = restaurant?.position?.lat, let longitude = restaurant?.position?.lon else { return }
        let restaurantCoordinate = CLLocationCoordinate2D(latitude: Double(latitude), longitude: Double(longitude))
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: restaurantCoordinate, span: span)

        customView.mapView.setRegion(region, animated: true)
        setupPin(restaurantCoordinate)
        setupRoute(restaurantCoordinate)
    }

    private func setupPin(_ coordinate: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.title = restaurant?.poi?.name
        pin.coordinate = coordinate

        customView.mapView.addAnnotation(pin)
    }

    private func setupRoute(_ coordinate: CLLocationCoordinate2D) {
        let userlatitude = UserDefaults.standard.float(forKey: "userLatitude")
        let userlongitude = UserDefaults.standard.float(forKey: "userLongitude")
        let usercoordinate = CLLocationCoordinate2D(latitude: Double(userlatitude), longitude: Double(userlongitude))

        showRouteOnMap(sourceCoordinate: usercoordinate, destinationCoordinate: coordinate)
    }

    private func calculateDistance(userCoordinates: CLLocationCoordinate2D, restaurantCoordinates: CLLocationCoordinate2D) -> CLLocationDistance {
        let userLocation = CLLocation.fromCLLocationCoordinate2D(coordinate: userCoordinates)
        let restaurantLocation = CLLocation.fromCLLocationCoordinate2D(coordinate: restaurantCoordinates)

        return restaurantLocation.distance(from: userLocation)
    }

    private func isRestaurantClose(_ distance: CLLocationDistance) -> Bool {
        distance <= 300
    }
}

extension SearchDetailsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .systemOrange
        renderer.lineWidth = 5.0
        return renderer
    }

    func showRouteOnMap(sourceCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        let distance = calculateDistance(userCoordinates: sourceCoordinate, restaurantCoordinates: destinationCoordinate)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = isRestaurantClose(distance) ? .walking : .automobile

        let directions = MKDirections(request: request)
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            if let route = unwrappedResponse.routes.first {
                self.customView.mapView.addOverlay(route.polyline)
                self.customView.mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets.init(top: 100.0, left: 50.0, bottom: 150.0, right: 100.0), animated: true)
            }
        }
    }
}
