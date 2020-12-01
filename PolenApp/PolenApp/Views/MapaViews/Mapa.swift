//
//  Mapa.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
import MapKit

public var selecionada: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)

public var zoomInstituicao: Bool = false


struct Mapa: View {
    @Environment(\.managedObjectContext) var viewContexts

    var locationManager = LocationManager()
    @ObservedObject var bank: BancoInstituicoes
   
    @State var checkpoints: [Checkpoint] = [
        Checkpoint(title: "Recomeço Refugiados", subtitle: "Aulas de português para haitianos", coordinate: .init(latitude: -7.9015, longitude: -34.8268)),
        Checkpoint(title: "Adus", subtitle: "Integração social de refugiados e vítimas de migrações forçadas", coordinate: .init(latitude: -7.9021, longitude: -34.8296))]
    
    @State var muralIsActive = false
    @State var loginIsActive = false

    @State var instituicaoID: UUID = UUID()
    
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
        NavigationView{
            ZStack{
                VStack{
                    LinkToMuralDaInstituicao(muralIsActive: $muralIsActive, instituicaoID: $instituicaoID)
                    
                    LinkToLogin(loginIsActive: $loginIsActive, instituicaoID: $instituicaoID)
                    
                    SearchBarMap(bank: bank)
                    
                    if bank.isSearching {
                        
                        searchInstituicao
                        
                    }else{
                        MapView(checkpoints: $checkpoints, muralsActive: $muralIsActive, instituicaoID: $instituicaoID)
                    }
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                self.loginIsActive.toggle()
            }, label: {
                Text("Login")
            }))
        }
    }
}

//struct Mapa_Previews: PreviewProvider {
//    static var previews: some View {
//        Mapa(bank: BancoInstituicoes()).colorScheme(.light)    }
//}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
