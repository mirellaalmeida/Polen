//
//  SwiftUIView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct NavigateToAddHistoria: View {
    @Binding var instituicaoID:UUID
    @Binding var addingHistoria:Bool
    
    var body: some View {
        NavigationLink(destination: AddHistoria(instituicaoID: $instituicaoID, isAdding: self.$addingHistoria),
                       isActive: $addingHistoria){
            EmptyView()
        }
    }
}
