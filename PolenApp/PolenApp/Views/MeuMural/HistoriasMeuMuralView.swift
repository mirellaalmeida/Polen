//
//  HistoriasMeuMuralView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct HistoriasMeuMuralView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: String
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    )  var instituicoes: FetchedResults<Instituicao>

    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasCard?
    @Binding var editHistoria: HistoriasCard?
    @Binding var isEditing: Bool
    
    var cardsInfos: some View {
        ForEach(instituicoes.first(where: {$0.id == instituicaoID})?.historiasArray ?? [], id: \.self){ historia in
            
            HistoriaItem(instituicaoID: $instituicaoID, historia: historia, verMais: $verMais, verHistoria: $verHistoria, editHistoria: $editHistoria, isEditing: isEditing)

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
            .padding([.leading, .trailing, .bottom])
        }
    }
}

struct HistoriaItem: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: String
    @ObservedObject var historia: HistoriasCard   // !! @ObserveObject is the key!!!
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasCard?
    @Binding var editHistoria: HistoriasCard?
    @State var isEditing: Bool
    
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: (historia.imagem ?? UIImage(named: "userIcon")?.pngData())!) ?? UIImage())
                .resizable()
                .cornerRadius(8.0)
                .frame(width: 300, height: 200)
                .shadow(color: .gray, radius: 0.5, x: 0, y: 0)
                .padding()
            
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
                
                EditButtonView(instituicaoID: $instituicaoID, isEditing: $isEditing, editHistoria: $editHistoria, historia: historia)
                
                Spacer()
                    .frame(width: 30)
                
                VerMaisButton(verMais: $verMais, verHistoria: $verHistoria, historia: historia)
            }
            
        }
        .frame(width: 320, height: 400)
    }
}
