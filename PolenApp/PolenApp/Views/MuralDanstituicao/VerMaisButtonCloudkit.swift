//
//  VerMaisButtonCloudkit.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 10/12/20.
//

import SwiftUI

import SwiftUI

struct VerMaisButtonCloudkit: View {
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasResume?
    
    var historia: HistoriasResume

    var body: some View {
        Button(action: {
            self.verHistoria = historia
            self.verMais.toggle()
        },
        label: {
            Text("Ler mais")
                .frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(#colorLiteral(red: 0.3294117647, green: 0.262745098, blue: 0.6470588235, alpha: 1)))
                .foregroundColor(Color(.white))
                .font(.system(size:12, weight: .bold))
                .cornerRadius(5)
        })
    }
}

