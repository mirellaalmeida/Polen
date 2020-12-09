//
//  Coordinator.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import Foundation
import Combine
import MapKit
import SwiftUI
import CoreData

var texto: String = ""

final class Coordinator: NSObject, MKMapViewDelegate{
    var instituicoes: FetchedResults<Instituicao>
    @Binding var muralIsActive: Bool
    @Binding var instituicaoID: String

    var control: MapView
    
    init(_ control: MapView, instituicoes: FetchedResults<Instituicao>, muralIsActive: Binding<Bool>, instituicaoID: Binding<String>) {
        self.control = control
        self.instituicoes = instituicoes
        _muralIsActive = muralIsActive
        _instituicaoID = instituicaoID
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first{
            if let annotation = annotationView.annotation{
                if annotation is MKUserLocation{
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
                if zoomInstituicao{
                    let region = MKCoordinateRegion(center: selecionada, latitudinalMeters: 500, longitudinalMeters: 500)
                    mapView.setRegion(region, animated: true)
//                    annotationView.isSelected = true
                    
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
        
        buttonPin.setImage(UIImage(named: "goToMuralButton"), for: UIControl.State())
        
        
        if annotationView == nil {
            
            buttonPin.addTarget(self, action: #selector(buttonPinSelected), for: .touchUpInside)
            
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
            
            annotationView?.rightCalloutAccessoryView = buttonPin
            annotationView?.image = UIImage(named: "pinIcon")
            
        }
        
        if annotation is MKUserLocation{
            return nil
            
        }
        return annotationView
    }
    
    
    //As funções abaixo não estão sendo utilizadas
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        texto = ((view.annotation?.title ?? "None")!)
    }
    //
    //        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    //
    //        }
    
    
    @objc func buttonPinSelected(){
        instituicaoID = instituicoes.first(where: {$0.nome == texto})?.id ?? instituicaoID

        muralIsActive.toggle()
    }
}
