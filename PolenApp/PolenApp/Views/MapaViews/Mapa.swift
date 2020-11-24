//
//  Mapa.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
import MapKit


struct Mapa: View {
    
    var locationManager = LocationManager()
    @ObservedObject var bank: BancoInstituicoes
    
    @State var checkpoints: [Checkpoint] = [
        Checkpoint(title: "Recomeço Refugiados", subtitle: "Aulas de português para haitianos", coordinate: .init(latitude: -7.9015, longitude: -34.8268)),
        Checkpoint(title: "Adus", subtitle: "Integração social de refugiados e vítimas de migrações forçadas", coordinate: .init(latitude: -7.9021, longitude: -34.8296))]
    
    
    public var body: some View {
        VStack{
            SearchBarMap(bank: bank)
            if bank.isSearching {
                
                List {
                    // Filtered list of names
                    ForEach((0..<bank.items!.count).filter{ (bank.items![$0].title?.hasPrefix(bank.searchText))! || bank.searchText == ""}, id:\.self) { index in
                        Button(action:{
                            UIApplication.shared.endEditing(true)
                            
                            // if  == "Adus"{
                            //  print("Dale Adus")
                            // }
                            
                            self.bank.searchText = ""
                            self.bank.isSearching = false
                        }){
                            Text(bank.items![index].title!)
                        }
                    }
                }
                .resignKeyboardOnDragGesture()
            }else{
                MapView(checkpoints: $checkpoints)
            }
        }
    }
    
    struct Mapa_Previews: PreviewProvider {
        static var previews: some View {
            Mapa(bank: BancoInstituicoes()).colorScheme(.light)    }
    }
    
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
