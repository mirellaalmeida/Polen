//
//  HistoriasView.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 26/11/20.
//

import SwiftUI

struct HistoriasView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    var cards: [HistoriasResume]?
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasResume?
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    var cardInfos: some View {
        ForEach(cards ?? [], id: \.self){ historia in
            VStack{
                Image(uiImage: (historia.image ?? UIImage(named: "userIcon")) ?? UIImage())
                    .resizable()
                    .cornerRadius(8.0)
                    .frame(width: 300, height: 200)
                    .shadow(color: .gray, radius: 0.5, x: 0, y: 0)
                    .padding()
                
                Text(historia.name)
                    .font(.system(size:16))
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Text(historia.description)
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding()
                
                VerMaisButtonCloudkit(verMais: $verMais, verHistoria: $verHistoria, historia: historia)
            }
            .frame(width: 320, height: 400)
            
        }
        .background(Color.white)
        .border(Color.gray, width: 0.5)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 0, y: 1)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 15){
                cardInfos
            }
            .padding([.leading, .trailing, .bottom])
        }
    }
}

//struct HistoriasView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoriasView()
//    }
//}


