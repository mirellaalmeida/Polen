//
//  NavigateToAddColabore.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct LinkToAddColaboreCard: View {
    @Binding var instituicaoID: String
    @Binding var addingHistoria: Bool
    
    var body: some View {
        NavigationLink(
            destination: AddColaboreCard(instituicaoID: $instituicaoID, isAdding: $addingHistoria),
            isActive: $addingHistoria) {
            EmptyView()
                .navigationBarHidden(true)
        }
    }
}
