//
//  ColaboreView.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 26/11/20.
//

import SwiftUI

struct ColaboreView: View {
    @Binding var instituicaoID:UUID

    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.id, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    

    
    var body: some View {
        
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 15){
                ForEach (instituicoes.first(where: {$0.id == instituicaoID})?.historiasArray ?? [], id: \.self){ colabore in
                    VStack{
                        Text(colabore.wrappedTitulo)
                            .font(.system(size:16))
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        
                        
                        Text(colabore.wrappedDescricao)
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding()
                        HStack{
                            DuplaBotoes()
                        }
                        
                    }
                    .frame(width: 340, height: 190)
                    
                }
                .background(Color.white)
                .border(Color.gray, width: 0.5)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3, x: 0, y: 1)
            }
            .padding([.leading, .trailing])
        }
    }
}

//struct ColaboreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColaboreView()
//    }
//}
