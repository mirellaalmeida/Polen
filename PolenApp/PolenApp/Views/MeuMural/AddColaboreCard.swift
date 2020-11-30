//
//  AddColaboreCard.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct AddColaboreCard: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: UUID
    @Binding var isAdding: Bool
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    var body: some View {
        VStack{
            Text("Adicionar Publicação")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            TextField("Título", text: $title)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Descrição", text: $description)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            Button(action: {
                let newCard = ColaboreCard(context: viewContext)
                newCard.titulo = title
                newCard.descricao = description
                newCard.relationship = instituicoes.first(where: {$0.id == instituicaoID})
                
                do {
                    try self.viewContext.save()
                } catch {
                    print("não foi possível salvar")
                }
                
                self.isAdding.toggle()
                
            }, label: {
                Text("Publicar")
                    .padding()
            })
            
        }
    }
}

/*
struct AddColaboreCard_Previews: PreviewProvider {
    static var previews: some View {
        AddColaboreCard()
    }
}*/
