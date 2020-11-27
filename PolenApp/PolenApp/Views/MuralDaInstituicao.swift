
//
//  MuralDaInstituicao.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
// swiftlint:disable all

struct MuralDaInstituicaoView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var muralDaInstituicaoIsActive: Bool
    @Binding var instituicaoID:UUID
    
    @State var verMais = false
    @State var verHistoria:HistoriasCard?
    
    @State private var didTap: Bool = false
    
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    init(muralDaInstituicaoIsActive: Binding<Bool>, instituicaoID: Binding<UUID>) {
        _muralDaInstituicaoIsActive = muralDaInstituicaoIsActive
        _instituicaoID = instituicaoID
        //Configurações para NavigationBar
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "Banner"), for: .default)
        //UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9688708186, green: 0.8066166639, blue: 0.3180420101, alpha: 1)
        UINavigationBar.appearance().shadowImage = UIImage()
        UIScrollView.appearance().bounces = false
        //        UIScrollView.appearance().backgroundColor = #colorLiteral(red: 0.9688708186, green: 0.8066166639, blue: 0.3180420101, alpha: 1)
        
    }
    
    
    var body: some View{
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    BannerMeuMural(instituicaoID: $instituicaoID)
                    
                    VStack(alignment: .leading){
                        Text("Colabore conosco")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        
                        ColaboreView(instituicaoID: $instituicaoID)
                    }
                    
                    Spacer()
                        .frame(height: 30.0)
                    
                    VStack(alignment: .leading) {
                        Text("Um pouco sobre nós")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        
                        HistoriasView(instituicaoID: $instituicaoID, verMais: $verMais, verHistoria: $verHistoria)
                        
                    }
                    
                    
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationBarTitle("Voltar")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $verMais) {
            VerMaisView(historia: $verHistoria, verMais: $verMais)
        }
        
        .navigationBarItems(trailing:
                                Button("Coração") {
                                    print("Help tapped!")
                                }
        )
    }
}

/*
#if DEBUG

 struct MuralView_Previews: PreviewProvider {
 static var previews: some View {
 MuralDaInstituicaoView(isActive: .constant(true), instituicaoID: )
 .previewDevice("iPhone 11")
 }
 }
 #endif
 */

