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
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @Binding var checkpoints: [Checkpoint]
    @Binding var muralsActive: Bool
    @Binding var instituicaoID: UUID
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.userTrackingMode = .follow
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self,
                           instituicoes: instituicoes,
                           muralIsActive: $muralsActive,
                           instituicaoID: $instituicaoID)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        uiView.addAnnotations(checkpoints)
        
    }
    
}
