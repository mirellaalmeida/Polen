//
//  ColaboreMeuMuralView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct ColaboreMeuMuralView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID:UUID
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    @State var stickersCount: Int = DuplaBotoes().possoCount + DuplaBotoes().vaiCount
    @State var editColaboreCard = false
    @State var seeStickers = false
    @State var isEditing: Bool


    var cardInfos: some View {
        ForEach(instituicoes.first(where: {$0.id == instituicaoID})?.colaboreArray ?? [], id: \.self){ colabore in

            ColaboreItem(colabore: colabore, isEditing: isEditing, stickersCount: stickersCount , editColaboreCard: editColaboreCard, seeStickers: seeStickers)
        }
        .background(Color.white)
        .border(Color.gray, width: 0.5)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 0, y: 1)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 15){
                cardInfos
            }
            .padding([.leading, .trailing])
        }
    }
}

struct ColaboreItem: View {
    @ObservedObject var colabore: ColaboreCard   // !! @ObserveObject is the key!!!
   // @Binding var verHistoria: ColaboreCard?
    @State var isEditing: Bool
    
    @State var stickersCount: Int = DuplaBotoes().possoCount + DuplaBotoes().vaiCount
    @State var editColaboreCard = false
    @State var seeStickers = false

    var buttonStickers: some View {
        Button(action: {
            self.seeStickers.toggle()
        }, label: {
            Text("Ver adesivos (\(stickersCount))")
                .font(.system(size:12, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                
            
        }).background(Color("Roxo"))
        .cornerRadius(5)
        
    }
    
    var body: some View {
        
        VStack{
            Text(colabore.wrappedTitulo)
                .font(.system(size:16))
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            Text(colabore.wrappedDescricao)
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding()
        
        

            HStack{
                EditButtonView2(isEditing: $isEditing, colabore: colabore)
                Spacer()
                    .frame(width: 30)
                buttonStickers
            }
            
        }
        .frame(width: 340, height: 190)
    }
}

