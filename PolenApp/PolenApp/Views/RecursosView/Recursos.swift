//
//  Recursos.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI

struct Recursos: View {
    @Environment(\.openURL) var openURL
    
//    @Binding var isActive: Bool
    
//    init(isActive: Binding<Bool>) {
//        _isActive = isActive
//        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "bannerFavoritosRecursos"), for: .default)
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UIScrollView.appearance().bounces = false
//    }
    
    var body: some View {
//        NavigationView{
        ScrollView(.vertical) {
            ZStack{
                Image("bannerFavoritosRecursos")
                Text("Recursos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
            }
            ZStack{
                Image("backgroundTexture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            LazyVStack{
                CardViewRecursos(imgRec: "capaCartilha",
                                 categoriaRec: "PDF",
                                 tituloRec: "Cartilha Multilíngue",
                                 descRec: "Instituto Migrações e Direitos Humanos (IMDH)",
                                 linkRec: "https://cutt.ly/VhbEZF8",
                                 nomeLinkRec: "Baixe aqui")
                CardViewRecursos(imgRec: "capaRefugeeNation",
                                 categoriaRec: "Site",
                                 tituloRec: "The Refugee Nation",
                                 descRec: "An orange and black flag inspired by the colors of the life vests. An orange and black flag to bring the world together to support refugees.",
                                 linkRec: "http://www.therefugeenation.com",
                                 nomeLinkRec: "Leia Mais")
                CardViewRecursos(imgRec: "capaCartilhaAcnur",
                                 categoriaRec: "PDF",
                                 tituloRec: "Cartilha para Solicitantes de Refúgio no Brasil",
                                 descRec: "ACNUR",
                                 linkRec: "https://cutt.ly/HhbRpyV",
                                 nomeLinkRec: "Baixe aqui")
            }
            }
        }
    }
//        .navigationBarHidden(true)
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(true)
}
//}


struct TelaRecursos_Previews: PreviewProvider {
    static var previews: some View {
        Recursos()
    }
}
