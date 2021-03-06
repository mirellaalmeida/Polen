//
//  TabBarView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 03/12/20.
//

import SwiftUI
import CloudKit

struct TabBarView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var instituicaoID: String = ""
    @State var tabSelected: Int?
    
    @State var arrayInstituicoes: [InstituicaoResume] = []
    
    @Binding var tabViewIsActive: Bool
    
    let login = UserDefaults.standard.bool(forKey: "isLogged")
    let userID = UserDefaults.standard.object(forKey: "userID") as? String
    
    var body: some View {
        //NavigationView {
            TabView {
                NavigationView {
                    Mapa(bank: BancoInstituicoes(), instituicoes: $arrayInstituicoes)
                }
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Mapa")
                }
                .tag(0)
                .navigationViewStyle(StackNavigationViewStyle())
           
                Favoritos( instituicoes: $arrayInstituicoes)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favoritos")
                }
                .tag(1)
                
                RecursosView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Recursos")
                }
                .tag(2)

                NavigationView {
                    if (!login) {
                        LoginView()
                    }
                    
                    if (login) {
                        MeuMural(instituicaoID: .constant(instituicoes.first(where: {$0.id == userID && $0.wrappedNome != " "})?.wrappedID ?? ""))
                    }
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Meu Mural")
                }
                .tag(3)
            }.accentColor(Color("Roxo"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(tabViewIsActive: .constant(true))
            TabBarView(tabViewIsActive: .constant(true))
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
