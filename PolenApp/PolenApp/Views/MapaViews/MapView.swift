//
//  MapView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import SwiftUI
import MapKit
import CloudKit
//import CoreLocation
//import Combine

struct MapView: UIViewRepresentable {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicoes: [InstituicaoResume]
    @Binding var instituicao: CKRecord?
    @Binding var colaboreCards: [HistoriasResume]?
    @Binding var historiaCards: [HistoriasResume]?
    @ObservedObject var bank: BancoInstituicoes
    @Binding var muralIsActive: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.userTrackingMode = .follow
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        CKInstituicao.fetchAddresses { results in
            switch results {
            case .success(let newInstituicoes):
                if instituicoes != newInstituicoes {
                    instituicoes.append(contentsOf: newInstituicoes)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        return Coordinator(self,
                           instituicoes: $instituicoes,
                           colaboreCards: $colaboreCards,
                           historiaCards: $historiaCards,
                           muralIsActive: $muralIsActive,
                           instituicao: $instituicao)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        uiView.addAnnotations(bank.items!)
    }
}
