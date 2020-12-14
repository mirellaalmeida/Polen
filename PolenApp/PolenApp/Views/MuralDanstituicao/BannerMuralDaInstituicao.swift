

//
//  BannerView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 20/11/20.
//

import SwiftUI
import CloudKit

struct BannerMuralDaInstituicao: View {
    //@Environment(\.managedObjectContext) var viewContext
    
//    @Binding var instituicaoID: String
    //@Binding var instituicaoID: CKRecord?
    var nome: String?
    var descricao: String?
    var cidade: String?
    var image: UIImage?
//    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    var background: some View {
        Image("Banner3")
            .resizable()
            .aspectRatio(contentMode: .fit)
            //.edgesIgnoringSafeArea(.top)
    }
    
    var header: some View {
        HStack(alignment: .center, spacing: 30){
            Image(uiImage: (image ?? UIImage(named: "userIcon")) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10) {
                Text(nome ?? "None")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)

                Text(descricao ?? "None")
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .frame(width: 200, alignment: .leading)
            }
            
            Spacer()
        }
        
        .padding([.leading, .top, .bottom])
    }
    
    var localization: some View {
        HStack{
            Image("Location")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20, alignment: .center)
            
            Text(cidade ?? "None")
                .font(.system(size: 14, weight: .medium, design: .default))
                .frame(height: 2, alignment: .leading)
        }
        .padding([.leading, .top])
    }
    
    var socialMedia: some View {
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
        .padding([.leading, .top])
    }
    
    var otherInfos: some View {
        VStack(alignment: .leading) {
            localization
            
            Image("Separador")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 10)
            
            socialMedia
        }
    }
    
    var infos: some View {
        VStack (alignment: .leading) {
            header
            
            otherInfos
        }
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            background
            
            infos
        })
    }
}

//struct BannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerMeuMural(instituicaoID: .constant(" "))
//    }
//}
