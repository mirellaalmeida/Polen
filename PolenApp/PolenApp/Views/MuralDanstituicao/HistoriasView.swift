//
//  HistoriasView.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 26/11/20.
//

import SwiftUI

struct HistoriasView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: String
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasCard?
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    var cardInfos: some View {
        ForEach(instituicoes.first(where: {$0.id == instituicaoID})?.historiasArray ?? [], id: \.self){ historia in
            VStack{
                Image("Doação")
                    .resizable()
                    .cornerRadius(8.0)
                    .frame(width: 320, height: 200)
                    .shadow(color: .gray, radius: 0.5, x: 0, y: 0)
                    .padding()
                
                Text(historia.wrappedTitulo)
                    .font(.system(size:16, weight: .bold))       .multilineTextAlignment(.leading)
                    .frame(width: 160, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text(historia.wrappedDescricao)
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding()
                
                VerMaisButton(verMais: $verMais, verHistoria: $verHistoria, historia: historia)
            }
            .frame(width: 320, height: 400)
            
        }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 18){
                cardInfos
            }
            .padding([.leading, .trailing])
        }
    }
}

//struct HistoriasView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoriasView()
//    }
//}


