//
//  EditButtonView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct EditButtonView: View {
    @Binding var isEditing: Bool
    
    var body: some View {
        Button(action: {
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
