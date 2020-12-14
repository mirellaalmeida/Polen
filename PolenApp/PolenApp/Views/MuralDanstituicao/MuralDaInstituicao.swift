
//
//  MuralDaInstituicao.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
import CloudKit
// swiftlint:disable all

struct MuralDaInstituicaoView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    //@Binding var instituicaoID: String
    @Binding var instituicao: CKRecord?
    @Binding var colaboreCards: [HistoriasResume]?
    @Binding var historiaCards: [HistoriasResume]?
    
    @State var verMais = false
    @State var verHistoria:HistoriasResume?
    
    @State private var isFavorite: Bool = false
    
    @Binding var instituicoes: [InstituicaoResume]
    
    
    //    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    init(instituicao: Binding<CKRecord?>,
         colaboreCards: Binding<[HistoriasResume]?>,
         historiaCards:Binding<[HistoriasResume]?>,
         instituicoes:Binding<[InstituicaoResume]>){
        
        _instituicao = instituicao
        _colaboreCards = colaboreCards
        _historiaCards = historiaCards
        _instituicoes = instituicoes
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "Banner"), for: .default)
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UIScrollView.appearance().bounces = false
    }
    
    var colaboreSubview: some View {
        VStack(alignment: .leading){
            Text("Colabore conosco")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            ColaboreView(cards: colaboreCards)
        }
    }
    
    var historiasSubview: some View {
        VStack(alignment: .leading) {
            Text("Um pouco sobre nós")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            HistoriasView(cards: historiaCards, verMais: $verMais, verHistoria: $verHistoria)
            
        }
    }
    
    var body: some View{
        ScrollView(.vertical){
            VStack(alignment: .leading){
                //BannerMeuMural(instituicaoID: $instituicaoID)
                if instituicao?["CD_imagem_ckAsset"] != nil {
                    BannerMuralDaInstituicao(nome: instituicao?["CD_nome"], descricao: instituicao?["CD_descricao"], cidade: instituicao?["CD_cidade"], image: UIImage(data: NSData(contentsOf: ((instituicao?["CD_imagem_ckAsset"] as? CKAsset)?.fileURL)!)! as Data))
                } else {
                    BannerMuralDaInstituicao(nome: instituicao?["CD_nome"], descricao: instituicao?["CD_descricao"], cidade: instituicao?["CD_cidade"])
                }
                
                colaboreSubview
                
                Spacer()
                    .frame(height: 30.0)
                
                historiasSubview
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    //adicionar aos favoritos
                                    if let index = instituicoes.firstIndex(where: {$0.name == instituicao?["CD_nome"]}) {
                                        
                                        instituicoes[index].favoritada.toggle()
                                    }
                                    
                                    self.isFavorite.toggle()
                                    
                                }, label: {
                                    if let index = instituicoes.firstIndex(where: {$0.name == instituicao?["CD_nome"]}) {
                                        
                                        if instituicoes[index].favoritada {
                                            Image(systemName: "heart.fill")
                                        }
                                        if !instituicoes[index].favoritada {
                                            Image(systemName: "heart")
                                        }
                                    }
                                    
                                })
        )
        .sheet(isPresented: $verMais) {
            VerMaisViewCloudkit(historia: $verHistoria, verMais: $verMais)
        }
    }
}

// #if DEBUG
// 
// struct MuralDaInstituicaoView_Previews: PreviewProvider {
// static var previews: some View {
//    MuralDaInstituicaoView(instituicaoID: .constant(" "))
// .previewDevice("iPhone 11")
// }
// }
// #endif


