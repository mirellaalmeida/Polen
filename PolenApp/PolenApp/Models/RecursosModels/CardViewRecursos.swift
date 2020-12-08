//
//  CardViewRecursos.swift
//  PolenApp
//
//  Created by Mirella Almeida on 04/12/20.
//

import SwiftUI

struct CardViewRecursos: View {
    var imgRec: String
    var categoriaRec: String
    var tituloRec: String
    var descRec: String
    var linkRec: String
    var nomeLinkRec: String
    
    
    var body: some View {
            
        VStack {
            Image(imgRec)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(categoriaRec)
                        .font(.headline)
                        .foregroundColor(.orange)
                    Text(tituloRec)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(descRec)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                    Link(destination: URL(string: linkRec)!, label: {
                        Text(nomeLinkRec)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .underline()
                            .foregroundColor(.purple)
                            .padding(.top)
                    })
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .background(Color.white)
            .border(Color.gray, width: 0.5)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 0, y: 1)
//        .cornerRadius(20)
//        .overlay(
//        RoundedRectangle(cornerRadius: 20)
//            .stroke(Color(.sRGB, red: 216, green: 216, blue: 216, opacity: 1), lineWidth: 0.5)
//        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardViewRecursos(imgRec: "capaCartilha",
                         categoriaRec: "PDF",
                         tituloRec: "Cartilha Multilíngue",
                         descRec: "Instituto Migrações e Direitos Humanos (IMDH)",
                         linkRec: "https://cutt.ly/VhbEZF8",
                         nomeLinkRec: "")
    }
}
