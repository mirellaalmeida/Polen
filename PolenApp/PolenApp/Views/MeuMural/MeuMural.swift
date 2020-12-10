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
    @State var addingHistoria = false
    @State var addingColabore = false
    
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
            
            ColaboreMeuMuralView(instituicaoID: $instituicaoID)
        }
        .padding(.bottom)
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
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .sheet(isPresented: $verMais) {
            VerMaisView(historia: $verHistoria, verMais: $verMais)
        }
    }
}

#if DEBUG

struct MuralView_Previews: PreviewProvider {
    static var previews: some View {
        MeuMural(instituicaoID: .constant(" "))
            .previewDevice("iPhone 11")
    }
}
#endif
