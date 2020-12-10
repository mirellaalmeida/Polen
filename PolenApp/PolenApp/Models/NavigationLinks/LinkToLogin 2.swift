//
//  SwiftUIView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct LinkToLogin: View {
    @Binding var loginIsActive: Bool
    @Binding var instituicaoID: UUID
    
    var body: some View {
        NavigationLink(
            destination: Login(instituicaoID: $instituicaoID, loginIsActive: $loginIsActive),
            isActive: $loginIsActive){
            EmptyView()
        }
    }
}
