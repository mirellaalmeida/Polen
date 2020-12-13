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
    
    @Binding var instituicaoID: String
    
    @State var verMais = false
    @State var verHistoria: HistoriasCard?
    @State var editHistoria: HistoriasCard?
    @State var editColabore: ColaboreCard?
    @State var addingHistoria = false
    @State var addingColabore = false
    @State var editingColabore = false
    @State var editingHistoria = false
    
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    init(instituicaoID: Binding<String>) {
        _instituicaoID = instituicaoID
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "Banner3"), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UIScrollView.appearance().bounces = false
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
            
            ColaboreMeuMuralView(instituicaoID: $instituicaoID, editCard: $editColabore, isEditing: $editingColabore)
        }
        .padding(.bottom)
    }
    
    var historiasSubview: some View {
        VStack(alignment: .leading) {
            headerHistoriaView
            
            HistoriasMeuMuralView(instituicaoID: $instituicaoID, verMais: $verMais, verHistoria: $verHistoria, editHistoria: $editHistoria, isEditing: $editingHistoria)
        }
    }
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                    Image("Banner3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height:2)
                    
                    BannerMeuMural(instituicaoID: $instituicaoID)
                        .padding(.top, 20)

                colaboreSubview
                
                Spacer()
                    .frame(height: 30.0)
                
                historiasSubview
            }
            .sheet(isPresented: $verMais) {
                VerMaisView(historia: $verHistoria, verMais: $verMais)
            }
//            .sheet(isPresented: $editingHistoria) {
//                EditHistoriaCard(card: verHistoria!)
//            }
            
        }
        .navigationBarHidden(true)
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
