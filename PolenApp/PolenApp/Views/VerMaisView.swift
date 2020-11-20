//
//  SwiftUIView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 20/11/20.
//

import SwiftUI

struct VerMaisView: View {
    @Binding var historia: SobreNos
    @Binding var verMais: Bool
    
    var body: some View {
        NavigationView{
            VStack{
                Text(historia.subtitle)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                    .padding()
            }
            .navigationBarTitle(historia.title, displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print(historia)
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
