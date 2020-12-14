//
//  RecursosView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 08/12/20.
//

import SwiftUI

struct RecursosView: View {
    @Environment(\.openURL) var openURL
    
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack{
                Image("bannerFavoritos")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
        .edgesIgnoringSafeArea(.top)
    }
    
}


struct TelaRecursos_Previews: PreviewProvider {
    static var previews: some View {
        RecursosView()
    }
}
