//
//  MyAnnotation.swift
//  MapKit1
//
//  Created by Vincenzo Caruso on 28/09/22.
//

import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var picture: UIImage?
    
    init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
    }
}
