//
//  AddButton.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct AddButtonView: View {
    @Binding var isAdding: Bool
    
    var body: some View {
        Button(action: {
            self.isAdding.toggle()
        }, label: {
            Image(systemName: "plus")
        })
        .padding()
    }
}


