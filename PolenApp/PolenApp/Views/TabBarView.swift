//
//  TabBarView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 03/12/20.
//

import SwiftUI

struct TabBarView: View {
    @State var muralIsActive = false
    @State var mapaIsActive = false
    @State var instituicaoID: UUID = UUID()
    
    @Binding var tabViewIsActive: Bool

    var body: some View {
        TabView{
            Mapa(bank: BancoInstituicoes(), mapaIsActive: $mapaIsActive)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Mapa")
                }
            
            Favoritos()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favoritos")
                }
            
            Recursos()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Recursos")
                }
            
            MeuMural(isActive: $muralIsActive, instituicaoID: $instituicaoID)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Meu Mural")
                }
        }.accentColor(Color("Roxo"))
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
