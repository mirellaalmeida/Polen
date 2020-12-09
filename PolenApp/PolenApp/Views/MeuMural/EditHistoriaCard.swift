//
//  EditHistoriaCard.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 03/12/20.
//

import SwiftUI

struct EditHistoriaCard: View {
    @Binding var titulo: String
    @Binding var descricao: String
    @State private var descriptionHeight: CGFloat = 0
    
    var saveStory: some View {
        Button(action: {
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
               // .background(Color(UIColor.secondarySystemBackground))
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
                    
            DynamicHeightTextField(text: $descricao, height: $descriptionHeight)
                .padding()
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
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
