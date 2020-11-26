
//
//  MuralDaInstituicao.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
// swiftlint:disable all

struct MuralDaInstituicaoView: View {
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.id, ascending: true)
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
    
    @Binding var isActive: Bool
    @Binding var instituicaoID:UUID

    @State var verMais = false
    
    @State var verMaisHistoria = SobreNos(id:-1, image: "", title: "", subtitle: "")
    
    @State private var didTap: Bool = false
    

    
    var body: some View{
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    BannerView()
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
                        
                        HistoriasView(instituicaoID: $instituicaoID)
        
                    }
                    
                    
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationBarTitle("Voltar")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $verMais) {
        VerMaisView(historia: $verMaisHistoria, verMais: $verMais)
                                }
        
        .navigationBarItems(trailing:
                    Button("Coração") {
                        print("Help tapped!")
                    }
        )
    }
}


#if DEBUG

struct MuralView_Previews: PreviewProvider {
    static var previews: some View {
        MuralDaInstituicaoView()
            .previewDevice("iPhone 11")
    }
}
#endif


