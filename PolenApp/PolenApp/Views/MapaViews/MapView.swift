//
//  MapView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import SwiftUI
import MapKit
//import CoreLocation
//import Combine

struct MapView: UIViewRepresentable {
    
    //@Binding var selectedPlace: MKPointAnnotation?
    //@Binding var showingPlaceDetails: Bool
    @Binding var checkpoints: [Checkpoint]
    
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.userTrackingMode = .follow
        
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        uiView.addAnnotations(checkpoints)
        
    }
    
}
