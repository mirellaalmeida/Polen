//
//  EditHistoriaCard.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 03/12/20.
//

import SwiftUI

struct EditHistoriaCard: View {
    //@Binding var isEditing: Bool
    var card: HistoriasCard
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    init(card: HistoriasCard) {
        self.card = card
    }
    
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
            Text("Edtar Publicação")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
            
            Text(card.wrappedTitulo)
                .padding()
            
            Text(card.wrappedDescricao)
                .padding()
            
            
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
