//
//  EditButtonView2.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 06/12/20.
//

import SwiftUI

struct EditButtonView2: View {
    @Binding var instituicaoID: String
    @Binding var isEditing: Bool
    @Binding var editCard: ColaboreCard?
    
    var colabore: ColaboreCard
    
    @State var titulo: String = ""
    @State var descricao: String = ""
    
    var body: some View {
//        NavigationLink(destination: EditColaboreCard(titulo: $titulo, tituloAntigo: colabore.wrappedTitulo, descricao: $descricao, isEditing: $isEditing), isActive: $isEditing){
//            EmptyView()
//        }
        
        NavigationLink(destination: EditColaboreCard(titulo: $titulo, instituicaoID: $instituicaoID, editCard: $editCard, descricao: $descricao, isEditing: $isEditing), isActive: $isEditing){
                    EmptyView()
                }
        Button(action: {
            self.titulo = colabore.wrappedTitulo
            self.descricao = colabore.wrappedDescricao
            
            self.editCard = colabore
            
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
