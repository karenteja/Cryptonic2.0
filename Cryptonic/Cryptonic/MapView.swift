//
//  MapView.swift
//  Cryptic
//
//  Created by Karen Teja on 10/27/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//


import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(latitude: 37.759436, longitude: -122.421559),
          span: MKCoordinateSpan(latitudeDelta: 0.0100, longitudeDelta: 0.0100))
        mapView.setRegion(region, animated: true)

        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 37.761607, longitude: -122.419101))
       
        let p11 = MKPointAnnotation()
        p11.coordinate = CLLocationCoordinate2D(latitude: 37.761607, longitude: -122.419101)
        p11.title = "Me"
        
        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  37.759488, longitude: -122.421561))
        
        let p22 = MKPointAnnotation()
        p22.coordinate = CLLocationCoordinate2D(latitude: 37.759488, longitude: -122.421561)
        p22.title = "Beehive"
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
          request.destination = MKMapItem(placemark: p2)
          request.transportType = .automobile

          let directions = MKDirections(request: request)
          directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addAnnotations([p22, p11])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
              route.polyline.boundingMapRect,
              edgePadding: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30),
              animated: true)
          }
        return mapView
      }

      func updateUIView(_ uiView: MKMapView, context: Context) {}
//    @State var coordinateRegion = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 37.759436, longitude: -122.421559),
//        span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
//    var annotations = [MyAnnotationItem(coordinate:  CLLocationCoordinate2D(latitude: 37.759436, longitude: -122.421559))]
//
//    var body: some View {
//        Map(coordinateRegion: $coordinateRegion, annotationItems: annotations) {
//            (location) -> MapPin in MapPin(coordinate: location.coordinate)
//        }
//
//    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
          let renderer = MKPolylineRenderer(overlay: overlay)
          renderer.strokeColor = .systemBlue
          renderer.lineWidth = 5
          return renderer
        }
      }
  }


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}

