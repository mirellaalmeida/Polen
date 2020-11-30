//
//  AddHistoria.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 23/11/20.
//

import SwiftUI

struct AddHistoriaCard: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: UUID
    @Binding var isAdding: Bool
    
    @State var title: String = ""
    @State var description: String = ""
    @State private var descriptionHeight: CGFloat = 0
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    func addStory() {
        let newStory = HistoriasCard(context: viewContext)
        newStory.titulo = title
        newStory.descricao = description
        newStory.daInstituicao = instituicoes.first(where: {$0.id == instituicaoID})
        
        do {
            try self.viewContext.save()
        } catch {
            print("não foi possível salvar")
        }
    }
    
    var publishStory: some View {
        Button(action: {
            addStory()
            
            self.isAdding.toggle()
            
        }, label: {
            Text("Publicar")
                .padding()
        })
    }

    var body: some View {
        NavigationView {
            VStack{
                Text("Adicionar Publicação")
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Text("Aqui vai ficar o adicionar imagem!")
                    .padding()
                
                AddCardInfos(title: $title, description: $description)
                
                Spacer()
                
                publishStory
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarHidden(true)
    }
}

/*
 struct AddHistoria_Previews: PreviewProvider {
 static var previews: some View {
 AddHistoria(isAdding: .constant(true))
 }
 }
 */
