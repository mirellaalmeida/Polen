//
//  BannerView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 20/11/20.
//

import SwiftUI

struct BannerView: View {
    
    
    var background: some View {
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
    }
    
    var header: some View {
        HStack{
            Image("Adus")
                .resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 170)
            
            VStack{
                Text("Adus")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 5.0)
                    .frame(width: 90, height: 30, alignment: .leading)
                
                
                
                Text("Organização sem fins lucrativos que atua na integração social de refugiados e estrangeiros vítimas de migrações forçadas.")
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .fontWeight(.regular)
                    .frame(width: 273, height: 100)
            }
        }
    }
    
    var localization: some View {
        HStack{
            Image("Location")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20, alignment: .center)
            
            
            Text("São Paulo - SP")
                .font(.system(size: 14, weight: .medium, design: .default))
                .frame(width: 100, height: 2, alignment: .leading)
        }
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
    }
    
    var otherInfos: some View {
        VStack (){
            
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
struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
