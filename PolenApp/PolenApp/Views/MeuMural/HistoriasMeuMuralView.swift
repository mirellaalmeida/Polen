//
//  HistoriasMeuMuralView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct HistoriasMeuMuralView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID:UUID
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var editHistoriaCard = false
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasCard?
    
    var cardsInfos: some View {
        ForEach(instituicoes.first(where: {$0.id == instituicaoID})?.historiasArray ?? [], id: \.self){ historia in
            VStack{
                Text(historia.wrappedTitulo)
                    .font(.system(size:16))
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Text(historia.wrappedDescricao)
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding()
                
                HStack{
                    /*NavigationLink(
                        destination: AddHistoriaCard(instituicaoID: $instituicaoID, isAdding: $editHistoriaCard),
                        isActive: $editHistoriaCard) {
                        EmptyView()
                    }*/
                    
                    EditButtonView(isEditing: $editHistoriaCard)
                        //.padding(.leading, 50)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    VerMaisButton(verMais: $verMais, verHistoria: $verHistoria, historia: historia)
                        //.padding(.trailing, 50)
                }
                
            }
            .frame(width: 340, height: 190)
            
        }
        .background(Color.white)
        .border(Color.gray, width: 0.5)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 0, y: 1)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 15){
                cardsInfos
            }
            .padding([.leading, .trailing])
        }
    }
}
