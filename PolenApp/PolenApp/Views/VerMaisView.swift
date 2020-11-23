//
//  SwiftUIView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 20/11/20.
//

import SwiftUI

struct VerMaisView: View {
    @Binding var historia: HistoriasCard?
    @Binding var verMais: Bool
    
    var body: some View {
        NavigationView{
            VStack{
                Text(historia!.titulo!)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text(historia!.descricao!)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
            .navigationBarItems(trailing: Button(action: {
                self.verMais = false
            }, label: {
                Text("Done")
                    .bold()
            }))
        }
    }
}

/*struct VerMaisHistoria_Previews: PreviewProvider {
    static var previews: some View {
        VerMaisView()
    }
}*/
