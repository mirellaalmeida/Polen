//
//  LinkToMuralDaInstituicao.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI
import CloudKit

struct LinkToMuralDaInstituicao: View {
    @Binding var muralIsActive: Bool
//    @Binding var instituicaoID: String
    @Binding var instituicao: CKRecord?
    @Binding var colaboreCards: [HistoriasResume]?
    @Binding var historiaCards: [HistoriasResume]?
    
    var body: some View {
        NavigationLink(
            destination: MuralDaInstituicaoView(instituicao: $instituicao, colaboreCards: $colaboreCards, historiaCards: $historiaCards),
            isActive: $muralIsActive){
            EmptyView()
        }
    }
}
