//
//  VerMaisButton.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct VerMaisButton: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasCard?
    
    var historia: HistoriasCard
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
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
