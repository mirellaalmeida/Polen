//
//  HistoriasView.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 26/11/20.
//

import SwiftUI

struct HistoriasView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID:UUID
    @Binding var verMais: Bool
    @Binding var verHistoria: HistoriasCard?
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 18){
                ForEach(instituicoes.first(where: {$0.id == instituicaoID})?.historiasArray ?? [], id: \.self){ historia in
                    VStack{
                        Image("Doação")
                            .resizable()
                            .cornerRadius(8.0)
                            .frame(width: 320, height: 200)
                            .shadow(color: .gray, radius: 0.5, x: 0, y: 0)
                            .padding()
                        
                        Text(historia.wrappedTitulo)
                            .font(.system(size:16, weight: .bold))       .multilineTextAlignment(.leading)
                            .frame(width: 160, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text(historia.wrappedDescricao)
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 12))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .padding()
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
                    
                    .frame(width: 320, height: 400)
                    
                }
            }
            .padding([.leading, .trailing])
        }
        
        
        
        
    }
}

//struct HistoriasView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoriasView()
//    }
//}


