//
//  Map.swift
//  Eco Travel
//
//  Created by Longde Lao on 22.04.23.
//


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    
    func makeUIView(context: Context) -> some UIView {
        
        mapView.showsTraffic = true
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.isPitchEnabled = false
        
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        
        return view
    }

    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapView {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: MapView
        
        init(parent: MapView) {
            self.parent = parent
            super.init()
        }
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
             let region = MKCoordinateRegion (
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01 )
                
             
             )
            parent.mapView.setRegion(region, animated: true)
        }
    }

    
}
