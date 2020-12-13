//
//  ColaboreMeuMuralView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct ColaboreMeuMuralView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: String
    @Binding var editCard: ColaboreCard?
    @Binding var isEditing: Bool
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var stickersCount: Int = DuplaBotoes().possoCount + DuplaBotoes().vaiCount
    
    @State var seeStickers = false


    var cardInfos: some View {
        ForEach(instituicoes.first(where: {$0.id == instituicaoID})?.colaboreArray ?? [], id: \.self){ colabore in

            ColaboreItem(colabore: colabore, instituicaoID: $instituicaoID, isEditing: $isEditing, editCard: $editCard, stickersCount: stickersCount , seeStickers: seeStickers)
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
    @Binding var instituicaoID: String
    @Binding var isEditing: Bool
    @Binding var editCard: ColaboreCard?
    
    @State var stickersCount: Int = DuplaBotoes().possoCount + DuplaBotoes().vaiCount
    
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
                EditButtonView2(instituicaoID: $instituicaoID, isEditing: $isEditing, editCard: $editCard, colabore: colabore)
                Spacer()
                    .frame(width: 30)
                buttonStickers

            }
            
        }
        .frame(width: 340, height: 190)
    }
}

//struct ColaboreMuralView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColaboreMeuMuralView(instituicaoID: .constant(" "))
//            .previewDevice("iPhone 11")
//    }
//}

