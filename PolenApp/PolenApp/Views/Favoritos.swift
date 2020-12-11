//
//  Favoritos.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
// swiftlint:disable all

struct Favoritos: View {
    
    @State var verFavoritos: CardViewFavoritos?
    @State private var didTap: Bool = false
    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Image("bannerFavoritos")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Favoritos")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
            }
            
            LazyVStack{
                CardViewFavoritos(imagemFavoritos: "IconAdus", tituloFavoritos: "Instituto Adus", descricaoFavoritos: "Integração social de refugiados e estrangeiros vítimas de migrações forçadas.")
                CardViewFavoritos(imagemFavoritos: "IconRecomeco", tituloFavoritos: "Abraço Cultural", descricaoFavoritos: "Um projeto pioneiro, que tem refugiados e refugiadas como professores de cursos de idiomas e cultura.")
                CardViewFavoritos(imagemFavoritos: "IconMigraflix", tituloFavoritos: "MigraFlix", descricaoFavoritos: "Ofeceremos experiências culturais e gastronômicas para promover a integração social e econômica de imigrantes e refugiados.")
                
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
    }
    
}
struct Favoritos_Previews: PreviewProvider {
    static var previews: some View {
        Favoritos()
    }
    
}
