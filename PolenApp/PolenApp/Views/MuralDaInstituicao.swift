//
//  MuralDaInstituicao.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
// swiftlint:disable all

struct BannerView: View {
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Image("Banner")
                .resizable().aspectRatio(contentMode: .fit).frame(minWidth: 300,
                                                                  idealWidth: 500,
                                                                  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                                                                  minHeight: 400,
                                                                  idealHeight: 400,
                                                                  maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                                                                  alignment: .top)
            // .offset(x: 0, y: -200)
            VStack (alignment: .leading) {
                HStack{
                    Image("Adus")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 170)
                        // .offset(x: 220, y: -140)
                        //.padding(20)
                    
                    VStack{
                        Text("Adus")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            //.padding([.top, .bottom, .trailing], 5)
                        // .offset(x: -300, y: -50)
                        Text("Organização sem fins lucrativos que atua na integração social de refugiados e estrangeiros vítimas de migrações forçadas.")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .fontWeight(.regular)
                            //.padding()
                            .frame(width: 273, height: 100)
                        //.offset(x: -220, y: -180)
                    }
                }
                
                VStack (){
                    HStack{
                        Text("São Paulo - SP")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .frame(width: 100, height: 2)
                        //.offset(x: 110, y: -90)
                        Image("Location")
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20)
                        //.offset(x: -27, y: -92)
                    }
                
                    Image("Separador")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 10)
                    //.offset(x: 20, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        Image("PhoneIcon")
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
                        //.offset(x: -200, y: -40)
                        Image("GloboIcon")
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
                        //.offset(x: -200, y: -40)
                        Image("InstaIcon")
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
                        //.offset(x: -200, y: -40)
                    }
                }
                

                
                
            }
            
        }
        )
    }
}

struct Colabore: Identifiable {
    var id: Int
    //    let title: String
    let name, description: String
    //let action: Button
}

struct SobreNos: Identifiable {
    var id: Int
    let image, title, subtitle: String
    //let action: Button
}

struct MuralDaInstituicaoView: View {
    init() {
        //Configurações para NavigationBar
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "Banner"), for: .default)
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9688708186, green: 0.8066166639, blue: 0.3180420101, alpha: 1)
        UINavigationBar.appearance().shadowImage = UIImage()
        UIScrollView.appearance().bounces = false
//        UIScrollView.appearance().backgroundColor = #colorLiteral(red: 0.9688708186, green: 0.8066166639, blue: 0.3180420101, alpha: 1)
        
    }
    let colaboreList: [Colabore] = [
        Colabore(id:0, name: "Aulas de Português", description: "Precisamos de professores de português urgentes. Entre em contato conosco."),
        Colabore(id:2, name: "Aulas de Espanhol", description: "Precisamos de professores de espanhol urgentes. Entre em contato conosco."),
        Colabore(id:3, name: "Aulas de Alemão", description: "Precisamos de professores de alemão urgentes. Entre em contato conosco."),
        Colabore(id:4, name: "Aulas de Russo", description: "Precisamos de professores de russo urgentes. Entre em contato conosco."),
    ]
    
    let sobreNosList: [SobreNos] = [
        SobreNos(id:0, image: "", title: "Doação de Móveis", subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
        SobreNos(id:2,  image: "", title: "Doação de Roupas", subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
        SobreNos(id:3,
                 image: "",
                 title: "Auxílio Transporte",
                 subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
        SobreNos(id:4, image: "", title: "Auxílio Moradia", subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
    ]
    
    
    var body: some View{
        NavigationView{
            ScrollView(.vertical){
            VStack(alignment: .leading){
                BannerView()
                Text("Colabore conosco")
                    .font(.headline)
                    .fontWeight(.bold)
                //.offset(x: 20, y: -200)
                
                ScrollView(.horizontal){
                    VStack {
                        HStack{
                            ForEach (colaboreList){ colabore in  VStack{
                                Text(colabore.name)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                Text(colabore.description)
                                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(4)
                                    //.padding(.all, 3.0)
                                //                                Rectangle()
                                //                                    .frame(width: 140, height: 100)
                                //                                    .background(Color.white)
                                //                                    .cornerRadius(5)
                                //                                    .padding(10)
                                //                                    .scaledToFit()
                                
                                
                            }
                            .frame(width: 300, height: 200)
                            }
                            .background(Color.white)
                            .border(Color.gray, width: 0.5)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3, x: 0, y: 1)
                        }
            
                    }
                }
                Text("Um pouco sobre nós")
                    .font(.headline)
                    .fontWeight(.bold)
                //.offset(x: 20, y: -30)
                ScrollView(.horizontal){
                    LazyHStack(spacing: 10){
                        ForEach (sobreNosList){ sobreNos in
                            VStack{
                                Image(systemName: "star")
                                    .resizable()
                                    .cornerRadius(8.0)
                                    .frame(width: 40, height: 40)
                                Text(sobreNos.title)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                Text(sobreNos.subtitle)
                                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(4)
                                    //.padding(.all, 3.0)
                                
                                
                            }
                            .frame(width: 300, height: 200)
                        }
                        .background(Color.white)
                        .border(Color.gray, width: 0.5)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0, y: 1)
                    
                    }   .padding([.top,.bottom],50)

                        
                }
            }

              .navigationBarTitle("", displayMode: .inline)
           
            
        }
        
    
        }
//        .background(Color(#colorLiteral(red: 0.9688708186, green: 0.8066166639, blue: 0.3180420101, alpha: 1)).edgesIgnoringSafeArea(.all))
    }
    
}

#if DEBUG
struct MuralView_Previews: PreviewProvider {
    static var previews: some View {
        MuralDaInstituicaoView()
            .previewDevice("iPhone 11")
    }
}
#endif

