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
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    @State var editHistoriaCard = false
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasCard?
    
    var editButton: some View {
        
            /*NavigationLink(
                destination: AddHistoriaCard(instituicaoID: $instituicaoID, isAdding: $editHistoriaCard),
                isActive: $editHistoriaCard) {
                EmptyView()
            }*/
            
            EditButtonView(isEditing: $editHistoriaCard)
    }
    
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
                    editButton
                    
                    VerMaisButton(verMais: $verMais, verHistoria: $verHistoria, historia: historia)
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
