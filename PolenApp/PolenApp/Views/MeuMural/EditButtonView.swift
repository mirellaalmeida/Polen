//
//  EditButtonView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct EditButtonView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: String
    @Binding var isEditing: Bool
    @Binding var editHistoria: HistoriasCard?
   
    var historia: HistoriasCard
    
    @State var titulo: String = ""
    @State var descricao: String = ""
    
    var body: some View {
//        NavigationLink(destination: EditHistoriaCard(titulo: $titulo,
//                                                     tituloAntigo: historia.wrappedTitulo,
//                                                     descricao: $descricao,
//                                                     isEditing: $isEditing,
//                                                     editHistoria: $editHistoria),
//                       isActive: $isEditing) {
//
//            EmptyView()
//        }
        
        NavigationLink(destination: EditHistoriaCard(instituicaoID: $instituicaoID,
                                                     titulo: $titulo,
                                                     descricao: $descricao,
                                                     isEditing: $isEditing,
                                                     editHistoria: $editHistoria),
                       isActive: $isEditing) {
            
            EmptyView()
        }
        
        Button(action: {
            self.titulo = historia.wrappedTitulo
            self.descricao = historia.wrappedDescricao
            
            self.editHistoria = historia
            
            self.isEditing.toggle()
            
            
        }, label: {
            Text("Editar")
                .foregroundColor(Color("Roxo"))
                .padding(.vertical, 8)
                .padding(.horizontal, 25)
                .font(.system(size:12, weight: .bold))


        })
//        .border(Color("Roxo"), width: 2)
//        .cornerRadius(10)
        .background(RoundedRectangle(cornerRadius: 4).stroke(Color("Roxo")))
    }
}
