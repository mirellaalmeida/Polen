//
//  Mapa.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
import MapKit
import CloudKit

public var selecionada: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)

public var zoomInstituicao: Bool = false


struct Mapa: View {
    @Environment(\.managedObjectContext) var viewContexts
    @Environment(\.presentationMode) var isPresented
    
    var locationManager = LocationManager()
    @ObservedObject var bank: BancoInstituicoes
    
    @State var checkpoints: [Checkpoint] = [
        Checkpoint(title: "Recomeço Refugiados", subtitle: "Aulas de português para haitianos", coordinate: .init(latitude: -16.3624, longitude: -49.1534)),
        Checkpoint(title: "Instituto Adus", subtitle: "Integração social de refugiados e vítimas de migrações forçadas", coordinate: .init(latitude: -22.0015, longitude: -53.5950))]
    
    @State var muralIsActive = false
    
    //@State var instituicaoID: String = ""
    @State var instituicao: CKRecord?
    @State var colaboreCards: [HistoriasResume]?
    @State var historiaCards: [HistoriasResume]?
    
    var searchInstituicao: some View {
        List {
            // Filtered list of names
            ForEach((0..<bank.items!.count).filter{ (bank.items![$0].title?.hasPrefix(bank.searchText))! || bank.searchText == ""}, id:\.self) { index in
                Button(action:{
                    UIApplication.shared.endEditing(true)
                    
                    self.bank.searchText = ""
                    self.bank.isSearching = false
                    selecionada = bank.items![index].coordinate
                    zoomInstituicao = true
                    
                }){
                    Text(bank.items![index].title!)
                }
            }
        }.listStyle(PlainListStyle())
        .resignKeyboardOnDragGesture()
    }
    
    public var body: some View {
        ZStack{
            VStack{
                LinkToMuralDaInstituicao(muralIsActive: $muralIsActive, instituicao: $instituicao, colaboreCards: $colaboreCards, historiaCards: $historiaCards)
                
                SearchBarMap(bank: bank)
                
                if bank.isSearching {
                    
                    searchInstituicao
                    
                } else {
                    MapView(instituicao: $instituicao,
                            colaboreCards: $colaboreCards,
                            historiaCards: $historiaCards,
                            checkpoints: $checkpoints,
                            muralIsActive: $muralIsActive)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct Mapa_Previews: PreviewProvider {
    static var previews: some View {
        Mapa(bank: BancoInstituicoes()).colorScheme(.light)    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
