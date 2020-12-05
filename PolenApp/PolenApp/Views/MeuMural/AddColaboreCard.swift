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
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    func addCard() {
        let newCard = ColaboreCard(context: viewContext)
        newCard.titulo = title
        newCard.descricao = description
        newCard.relationship = instituicoes.first(where: {$0.id == instituicaoID})
        
        do {
            try self.viewContext.save()
        } catch {
            print("não foi possível salvar")
        }
    }
    
    var publishCard: some View {
        Button(action: {
            addCard()
            
            self.isAdding.toggle()
            
        }, label: {
            Text("Publicar")
                .padding()
        })
    }
    
    var body: some View {
        VStack {
            Text("Adicionar Publicação")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
            
            AddCardInfos(title: $title, description: $description)
            
            Spacer()
            
            publishCard
        }
    }
}

/*
struct AddColaboreCard_Previews: PreviewProvider {
    static var previews: some View {
        AddColaboreCard()
    }
}*/
