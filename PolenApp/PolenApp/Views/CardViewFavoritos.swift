//
//  CardViewFavoritos.swift
//  PolenApp
//
//  Created by Livia  on 03/12/20.
//

import SwiftUI
// swiftlint:disable all
struct CardViewFavoritos: View {
    
    var imagemFavoritos: String
    var tituloFavoritos: String
    var descricaoFavoritos: String
    
    var body: some View {
        
        VStack{
            HStack {
                Image(imagemFavoritos)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 100, alignment: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(tituloFavoritos)
                        .font(.system(size:18))
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text(descricaoFavoritos)
                        .font(.system(size:14))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                })
                .layoutPriority(10)
                .frame(width: 250, height: 130)
                Spacer()
            }
            .frame(width: 370, height: 130.0)
            .background(Color.white)
            .border(Color.gray, width: 0.5)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 0, y: 1)
            .padding(8)
        }
    }
}

struct CardViewFavoritos_Previews: PreviewProvider {
    static var previews: some View {
        CardViewFavoritos(imagemFavoritos: "IconAdus", tituloFavoritos: "Instituto Adus", descricaoFavoritos: "Integração social de refugiados e estrangeiros vítimas de migrações forçadas.")
    }
}
