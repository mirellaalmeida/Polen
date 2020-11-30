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
        })
    }
}
