//
//  MuralDaInstituicao.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
// swiftlint:disable all

struct MeuMural: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var isActive:Bool
    @Binding var instituicaoID:UUID
    
    @State var verMais = false
    @State var verHistoria: HistoriasCard?
    @State var addingHistoria = false
    @State var addingColabore = false
    
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    init(isActive: Binding<Bool>, instituicaoID: Binding<UUID>) {
        _isActive = isActive
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
                        HStack {
                            Text("Colabore conosco")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "plus")
                            })
                            
                            .padding()
                        }
                        
                        ColaboreView(instituicaoID: $instituicaoID)
                        
                    }
                    
                    
                    Spacer()
                        .frame(height: 30.0)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Um pouco sobre nós")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                            
                            Spacer()
                            
                            NavigationLink(destination: AddHistoria(instituicaoID: $instituicaoID, isAdding: self.$addingHistoria),
                                           isActive: $addingHistoria){
                                EmptyView()
                            }
                            
                            Button(action: {
                                self.addingHistoria.toggle()
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .padding()
                            
                        }
                        
                        HistoriasView(instituicaoID: $instituicaoID, verMais: $verMais, verHistoria: $verHistoria)
                        
                    }
                    
                    
                    
                }
                //.navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                //.navigationBarTitle("", displayMode: .inline)
            }
            .navigationBarHidden(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $verMais) {
            VerMaisView(historia: $verHistoria, verMais: $verMais)
        }
        
    }
}

/*
 #if DEBUG
 struct MuralView_Previews: PreviewProvider {
 static var previews: some View {
 MeuMural(isActive: .constant(true))
 .previewDevice("iPhone 11")
 }
 }
 #endif
 */
