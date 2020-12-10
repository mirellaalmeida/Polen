//
//  Ajuda.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI

struct Ajuda: View {
    var background: some View {
        Image("Banner2")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth: 300,
                   idealWidth: 500,
                   maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                   minHeight: 200,
                   idealHeight: 200,
                   maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                   alignment: .top)
    }
    
    var header: some View {
        VStack(alignment: .leading){
            Text("Aq vem o título")
                .font(.system(size: 20, weight: .bold, design: .default))
                .padding(.horizontal)
                .padding(.top, 100)

            Text("Aq vem a descrição")
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.horizontal)
        }
      

    }
    
    var body: some View {
        ZStack(alignment: .top){
            background
            VStack(alignment: .leading){
                header
                    .padding(.bottom, 100)
                    .padding(.leading)
                StickerList(type: true, title: "Posso ajudar!")
                    .frame(alignment: .leading)
                    .padding()
                    .padding(.bottom, 40)
                StickerList(type: false, title: "Vai da certo!")
                    .frame(alignment: .leading)
                    .padding()
            }
            
        } .edgesIgnoringSafeArea(.top)
       
    }
}

struct Ajuda_Previews: PreviewProvider {
    static var previews: some View {
        Ajuda()
    }
}

struct StickerList: View {
    
    var color: Color
    var title: String
    
    init(type: Bool, title: String){
        if (type){
            color = Color("Roxo")
        }else{
            color = Color("Laranja")
        }
        
        self.title = title
    }
    
    
    var header: some View{
        HStack{
            Circle()
                .foregroundColor(color)
                .frame(width: 50, height: 50, alignment: .leading)
                
            Text(title)
                .font(.system(size:20, weight: .bold))
            Spacer()
        }
        
    }
    
    var instituicoesList: some View{
        VStack{
            ForEach(0...1, id: \.self){ inst in
                HStack{
                    Text("Nome da instituicao")
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                   
                }
                
                Divider()
                .padding(10)
                
            }
           
        }
    }
    var body: some View {
        VStack(){
            header
                .frame(alignment: .leading)
                .padding(.bottom, 20)
            instituicoesList
        }
        .padding(.horizontal)
        
        
    }
    
}
