//
//  Coordinator.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import Foundation
import MapKit
import SwiftUI

var texto: String = ""

final class Coordinator: NSObject, MKMapViewDelegate{
    
    
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first{
            if let annotation = annotationView.annotation{
                if annotation is MKUserLocation{
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
            
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //Exemplo de como manipular as Annotations
        
        //        if view.annotation?.title == "My Location"{
        //            view.pinTintColor = .blue
        //        }
        
        let annotationIdentifier = "Placemark"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        let buttonPin = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
        
        buttonPin.setImage(UIImage(named: "userLocationIcon"), for: UIControl.State())
        
        
        if annotationView == nil {
            
            buttonPin.addTarget(self, action: #selector(buttonPinSelected), for: .touchUpInside)
            
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
            
            annotationView?.rightCalloutAccessoryView = buttonPin
            
        }
        
        if annotation is MKUserLocation{
            return nil
            
        }
        
        return annotationView
    }
    
    
    //As funções abaixo não estão sendo utilizadas
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        texto = "\(String(describing: view.annotation?.title))"
        print("A insituição selecionada foi: \(texto)")
    }
    //
    //        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    //
    //        }
    
    
    @objc func buttonPinSelected(){
        print(texto)
    }
}
