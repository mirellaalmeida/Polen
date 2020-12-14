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

final class Coordinator: NSObject, MKMapViewDelegate {
    //var instituicoes: FetchedResults<Instituicao>
    @Binding var instituicoes: [InstituicaoResume]
    
    @Binding var colaboreCards: [HistoriasResume]?
    @Binding var historiaCards: [HistoriasResume]?
    @Binding var instituicao: CKRecord?
    
    @Binding var muralIsActive: Bool
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    
    var control: MapView
    
    init(_ control: MapView,
         instituicoes: Binding<[InstituicaoResume]>,
         colaboreCards: Binding<[HistoriasResume]?>,
         historiaCards:Binding<[HistoriasResume]?>,
         muralIsActive: Binding<Bool>,
         instituicao: Binding<CKRecord?>) {
        self.control = control
        _instituicoes = instituicoes
        _colaboreCards = colaboreCards
        _historiaCards = historiaCards
        _muralIsActive = muralIsActive
        _instituicao = instituicao
    }
    
    //    init(_ control: MapView, instituicoes: Binding<[InstituicaoResume]>, muralIsActive: Binding<Bool>, instituicao: Binding<CKRecord?>) {
    //        self.control = control
    //        _instituicoes = instituicoes
    //        _muralIsActive = muralIsActive
    //        _instituicao = instituicao
    //    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first{
            if let annotation = annotationView.annotation{
                if testeZoom{
                    if annotation is MKUserLocation{
                        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                        mapView.setRegion(region, animated: true)
                    }
                    if zoomInstituicao{
                        let region = MKCoordinateRegion(center: selecionada, latitudinalMeters: 1000, longitudinalMeters: 1000)
                        mapView.setRegion(region, animated: true)
                        zoomInstituicao = false
                        testeZoom = false
                        //                    annotationView.isSelected = true
                        
                    }
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
    //            func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    //            }
    
    
    @objc func buttonPinSelected(){
        if let index = instituicoes.firstIndex(where: {$0.name == texto}) {
            publicDatabase.fetch(withRecordID: instituicoes[index].id) { (record, error) in
                if let fetchedInfo = record {
                    self.instituicao = fetchedInfo
                    
                    CKInstituicao.fetchHistorias(instituicaoID: fetchedInfo.recordID) { results in
                        switch results {
                        case .success(let newHistorias):
                            if newHistorias != self.historiaCards {
                                self.historiaCards = newHistorias
                            }
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    CKInstituicao.fetchColabore(instituicaoID: fetchedInfo.recordID) { results in
                        switch results {
                        case .success(let newCards):
                            if newCards != self.colaboreCards {
                                self.colaboreCards = newCards
                            }
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    self.muralIsActive.toggle()
                } else {
                    print("failure on fetching user data from icloud: \(String(describing: error))")
                }
            }
        }
        
        // muralIsActive.toggle()
    }
}
