//
//  LinkToMeuMural.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 05/12/20.
//

import SwiftUI

struct LinkToMeuMural: View {
    @Binding var meuMuralIsActive: Bool
    @Binding var instituicaoID: UUID
    
    var body: some View {
        NavigationLink(destination: MeuMural(isActive: $meuMuralIsActive, instituicaoID: $instituicaoID), isActive: $meuMuralIsActive) {
            EmptyView()
        }
    }
}
