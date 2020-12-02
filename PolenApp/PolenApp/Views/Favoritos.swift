//
//  Favoritos.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

// swiftlint:disable all
import SwiftUI

struct Favoritos: View {
    
    var bannerFavoritos: String
    var tituloFavoritos: String

    
    var body: some View {
        VStack{
            Image(bannerFavoritos)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(tituloFavoritos)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.black)
                        
                    }
                }

        }

struct Favoritos_Previews: PreviewProvider {
    static var previews: some View {
        Favoritos(bannerFavoritos: "", tituloFavoritos: "")
    }
}
