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
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
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
    
    var headerColaboreView: some View {
        HStack {
            Text("Colabore conosco")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            LinkToAddColaboreCard(instituicaoID: $instituicaoID, addingHistoria: $addingColabore)
            
            AddButtonView(isAdding: $addingColabore)
        }
    }
    
    var headerHistoriaView: some View {
        HStack {
            Text("Um pouco sobre nós")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            LinkToAddHistoriaCard(instituicaoID: $instituicaoID, addingHistoria: $addingHistoria)
            
            AddButtonView(isAdding: $addingHistoria)
        }
    }
    
    var colaboreSubview: some View {
        VStack(alignment: .leading){
            headerColaboreView
            
            ColaboreMeuMuralView(instituicaoID: $instituicaoID)
        }
    }
    
    var historiasSubview: some View {
        VStack(alignment: .leading) {
            headerHistoriaView
            
            HistoriasMeuMuralView(instituicaoID: $instituicaoID, verMais: $verMais, verHistoria: $verHistoria)
        }
    }
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                BannerMeuMural(instituicaoID: $instituicaoID)
                
                colaboreSubview
                
                Spacer()
                    .frame(height: 30.0)
                
                historiasSubview
            }
            .sheet(isPresented: $verMais) {
               VerMaisView(historia: $verHistoria, verMais: $verMais)
            }
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
