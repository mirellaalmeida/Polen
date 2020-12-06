//
//  EditButtonView2.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 06/12/20.
//

import SwiftUI

struct EditButtonView2: View {
    @Binding var isEditing: Bool
    var colabore: ColaboreCard
    @State var titulo: String = ""
    @State var descricao: String = ""
    
    var body: some View {
        NavigationLink(destination: EditHistoriaCard(titulo: $titulo, descricao: $descricao), isActive: $isEditing){
            EmptyView()
        }
        Button(action: {
            titulo = colabore.wrappedTitulo
            descricao = colabore.wrappedDescricao
            self.isEditing.toggle()
        }, label: {
            Text("Editar")
                .foregroundColor(Color("Roxo"))
                .padding(.vertical, 8)
                .padding(.horizontal, 25)
                .font(.system(size:12, weight: .bold))


        })
        .background(RoundedRectangle(cornerRadius: 4).stroke(Color("Roxo")))
    }
}

//struct EditButtonView2_Previews: PreviewProvider {
//    static var previews: some View {
//        EditButtonView2()
//    }
//}
