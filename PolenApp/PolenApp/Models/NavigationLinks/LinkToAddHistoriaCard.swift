//
//  SwiftUIView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct LinkToAddHistoriaCard: View {
    @Binding var instituicaoID: String
    @Binding var addingHistoria: Bool
    
    var body: some View {
        NavigationLink(destination: AddHistoriaCard(instituicaoID: $instituicaoID, isAdding: self.$addingHistoria),
                       isActive: $addingHistoria){
            EmptyView()
        }
    }
}
