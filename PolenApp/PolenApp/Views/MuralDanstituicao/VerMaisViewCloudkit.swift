//
//  VerMaisViewCloudkit.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 10/12/20.
//

import SwiftUI

struct VerMaisViewCloudkit: View {
    @Binding var historia: HistoriasResume?
    @Binding var verMais: Bool
    
    var body: some View {
        VStack{
            Text(historia!.name)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(historia!.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: {
            self.verMais.toggle()
        }, label: {
            Text("Done")
                .bold()
        }))
    }
}
