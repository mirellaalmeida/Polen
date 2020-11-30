

//
//  BannerView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 20/11/20.
//

import SwiftUI

struct BannerMeuMural: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: UUID
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Image("Banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 300,
                       idealWidth: 500,
                       maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       minHeight: 400,
                       idealHeight: 400,
                       maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       alignment: .top)
            
            VStack (alignment: .leading) {
                HStack{
                    Image("Adus")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 170)
                    
                    VStack{
                        Text(instituicoes.first(where: {$0.id == instituicaoID})?.nome ?? "None")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        Text(instituicoes.first(where: {$0.id == instituicaoID})?.descricao ?? "None")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .fontWeight(.regular)
                            .frame(width: 273, height: 100)
                    }
                }
                
                VStack (){
                    HStack{
                        Image("Location")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20, alignment: .center)
                        
                        
                        Text(instituicoes.first(where: {$0.id == instituicaoID})?.cidade ?? "None")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .frame(width: 100, height: 2, alignment: .leading)
                    }
                    
                    Image("Separador")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 10)
                    
                    HStack{
                        Image("PhoneIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        
                        Image("GloboIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        
                        Image("InstaIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
        )
    }
}
/*
struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}*/
