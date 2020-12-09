//
//  LinkToMuralDaInstituicao.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct LinkToMuralDaInstituicao: View {
    @Binding var muralIsActive: Bool
    @Binding var instituicaoID: UUID
    
    var body: some View {
        NavigationLink(
            destination: MuralDaInstituicaoView(muralDaInstituicaoIsActive: $muralIsActive, instituicaoID: $instituicaoID),
            isActive: $muralIsActive){
            EmptyView()
        }
    }
}
