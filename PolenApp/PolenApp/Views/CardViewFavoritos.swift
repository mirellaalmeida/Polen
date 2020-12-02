//
//  CardViewFavoritos.swift
//  PolenApp
//
//  Created by Lívia Silva Oliveira on 30/11/20.
//

import SwiftUI
// swiftlint:disable all

struct CardViewFavoritos: View {
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Image("BannerFavoritos")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 300,
                       idealWidth: 500,
                       maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       minHeight: 400,
                       idealHeight: 400,
                       maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       alignment: .top)
                .padding(.top)
            
            Text("Favoritos")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(80)
            
            ScrollView(.vertical, showsIndicators: false){
                HStack(){
                    Image("AdusFavoritos")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 220, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(20)
                    
                    VStack (alignment: .leading, spacing: 25, content: {
                    Text("Instituto Adus")
                        .font(.system(size:22, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .frame(width: 140, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Divider().frame(height: 0.5).background(Color.gray)
                    Text("Integração social de refugiados e estrangeiros vítimas de migrações forçadas.")
                        .font(.system(size:16, weight: .regular))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .frame(width: 160, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                }
                
            }
            
        }
        )
    }
}

struct CardViewFavoritos_Previews: PreviewProvider {
    static var previews: some View {
        CardViewFavoritos()
    }
}
