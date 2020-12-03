//
//  CardViewFavoritos.swift
//  PolenApp
//
//  Created by Livia  on 03/12/20.
//

import SwiftUI

struct CardViewFavoritos: View {
    
    var bannerFavoritos:String
    var tituloBanner: String
    var imagemFavoritos: String
    var tituloFavoritos: String
    var descricaoFavoritos: String
    
    var body: some View {
        VStack{
            Image(imagemFavoritos)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack{
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text(tituloFavoritos)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(descricaoFavoritos.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                })
                .layoutPriority(10)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(7)
        .overlay(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Overlay Content@*/Text("Placeholder")/*@END_MENU_TOKEN@*/)
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray)
        ding((.top, .horizontal))
    }
}

struct CardViewFavoritos_Previews: PreviewProvider {
    static var previews: some View {
        CardViewFavoritos()
    }
}
