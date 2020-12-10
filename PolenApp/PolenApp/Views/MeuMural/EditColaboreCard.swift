//
//  EditColaboreCard.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 06/12/20.
//

import SwiftUI

struct EditColaboreCard: View {
    @Binding var titulo: String
    var tituloAntigo: String
    @Binding var descricao: String
    @State private var descriptionHeight: CGFloat = 0
    @Environment(\.managedObjectContext) var viewContext
    @Binding var isEditing: Bool


    @FetchRequest(
        entity: ColaboreCard.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ColaboreCard.titulo, ascending: true)
        ]
    ) var cards: FetchedResults<ColaboreCard>
    
    func saveCard() {
        for card in cards {
            print(card.titulo)
            print("Titulo antigo: " + tituloAntigo)
            if (card.titulo == tituloAntigo){
                card.titulo = titulo
                card.descricao = descricao
                
                
                do {
                    print("entrou no if")
                    print(card.titulo)
                    try self.viewContext.save()
                } catch {
                    print("não foi possível salvar")
                }
            }
        }
    }
    var saveStory: some View {
        Button(action: {
            saveCard()
            isEditing.toggle()
            
        }, label: {
            Text("Salvar")
                .padding()
                .foregroundColor(.white)
                .padding(.horizontal, 50)
        })
        .background(Color("Roxo"))
        .cornerRadius(10)
        .padding(.top, 25)
        .padding(.bottom, 40)
    }
    
    var body: some View {
        VStack{
            Text("Editar Publicação")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
                .padding(.top,30)

            TextField("", text: $titulo)
                .padding()
                .foregroundColor(.black)
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            DynamicHeightTextField(text: $descricao, height: $descriptionHeight)
                .padding()
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            saveStory
        }
    }
}

//struct EditColaboreCard_Previews: PreviewProvider {
//    static var previews: some View {
//        EditColaboreCard()
//    }
//}
