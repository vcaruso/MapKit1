//
//  MapView.swift
//  MapKit1
//
//  Created by Vincenzo Caruso on 28/09/22.
//


import SwiftUI
import MapKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}


struct MapViewManual: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.mapType = .satellite
        map.isRotateEnabled = false
        map.delegate = context.coordinator
        
        let location = CLLocation(latitude: 40.7637825011971, longitude: -73.9731328627541)
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        map.setRegion(region, animated: true)
        
        let annotation = MyAnnotation(coordinate: location.coordinate)
        annotation.title = "Apple Store"
        annotation.subtitle = "Think Different"
        annotation.picture = UIImage(systemName: "tray.circle.fill")
        map.addAnnotation(annotation)
        
        return map
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    typealias UIViewType = MKMapView
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if let temp = annotation as? MyAnnotation {
                var view = mapView.dequeueReusableAnnotationView(withIdentifier: "Pins") as? MKAnnotationView
                if view == nil {
                    view = MKAnnotationView(annotation: temp, reuseIdentifier: "Pins")//MKMarkerAnnotationView(annotation: temp, reuseIdentifier: "Pins")
                    view?.image = UIImage(systemName: "paperplane.circle")?.resized(to: CGSize(width: 64, height: 64))
                    view?.canShowCallout = true
                    let leftImage = UIImageView(image: temp.picture)
                    view?.leftCalloutAccessoryView = leftImage // may be also on right side
                    
                    
                    //view?.glyphText = "Place"
                    //view?.markerTintColor = UIColor.blue
                    //view?.titleVisibility = .hidden
                } else {
                    view?.annotation = annotation
                }
                return view
            }
                return nil
        }
    }
    
}
