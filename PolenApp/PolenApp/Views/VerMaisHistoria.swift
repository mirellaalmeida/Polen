//
//  SwiftUIView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 20/11/20.
//

import SwiftUI

struct VerMaisView: View {
    @State var historia: SobreNos
    var body: some View {
        Text(Historia.name)
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
        
        Text(Historia.description)
            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.center)
            .lineLimit(4)
            .padding()
    }
}

struct VerMaisHistoria_Previews: PreviewProvider {
    static var previews: some View {
        VerMaisView()
    }
}*/
