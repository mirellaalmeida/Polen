//
//  EditHistoriaCard.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 03/12/20.
//

import SwiftUI

struct EditHistoriaCard: View {
    //@Binding var isEditing: Bool
    //@Binding var card: HistoriasCard
    @Binding var titulo: String
    @Binding var descricao: String
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
//    init(card: HistoriasCard, titulo: String) {
//        self.card = card
//        self.titulo = titulo
//    }
    
    var saveStory: some View {
        Button(action: {
            //self.isEditing.toggle()
            
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
//
//            Text(card.wrappedTitulo)
//                .padding()
//
//            Text(card.wrappedDescricao)
//                .padding()
//
            TextField("", text: $titulo)
                .padding()
                .foregroundColor(.black)
               // .background(Color(UIColor.secondarySystemBackground))
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            TextField("", text: $descricao)
                .padding()
                .foregroundColor(.black)
               // .background(Color(UIColor.secondarySystemBackground))
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            
//            TextEditor(text: card.$wrappedDescricao )
//                .font(.body)
//                .cornerRadius(5)
//                .shadow(color: Color.black.opacity(0.18), radius: 0.8, y: 1)
//                .frame(height: 20)
            
            //AddCardInfos(title: $title, description: $description)
            
            Spacer()
            
            saveStory
        }.environment(\.horizontalSizeClass, .compact)
    }
}

//struct EditHistoriaCard_Previews: PreviewProvider {
//    static var previews: some View {
//        EditHistoriaCard()
//    }
//}
