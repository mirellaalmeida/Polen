//
//  MuralDaInstituicao.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
// swiftlint:disable all

struct MuralDaInstituicaoView: View {
    init() {
        //Configurações para NavigationBar
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "Banner"), for: .default)
        //UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9688708186, green: 0.8066166639, blue: 0.3180420101, alpha: 1)
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
        SobreNos(id:0, image: "", title: "Doação de Móveis", subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo...A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo...A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo...A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo...A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo...A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
        SobreNos(id:2,  image: "", title: "Doação de Roupas", subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
        SobreNos(id:3,
                 image: "",
                 title: "Auxílio Transporte",
                 subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
        SobreNos(id:4, image: "", title: "Auxílio Moradia", subtitle: "A ação é destinada a coletar doação de roupas, mantimentos, fraudas e outras necessidades que estão sendo detectadas pelo..."),
    ]
    
    @State var verMais = false
    
    @State var verMaisHistoria = SobreNos(id:-1, image: "", title: "", subtitle: "")
    
    var body: some View{
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    BannerView()
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text("Colabore conosco")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "plus")
                            })
                            .padding()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 10){
                                ForEach (colaboreList){ colabore in  VStack{
                                    Text(colabore.name)
                                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(colabore.description)
                                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(4)
                                        .padding()
                                }
                                .frame(width: 300, height: 200)
                            
                                }
                                .background(Color.white)
                                .border(Color.gray, width: 0.5)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 3, x: 0, y: 1)
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                    .padding(.top, -40.0)
                    
                    Spacer()
                        .frame(height: 30.0)
                   
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Um pouco sobre nós")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "plus")
                            })
                            .padding()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
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
                                    }
                                    .onTapGesture {
                                        //Por algum motivo, só funciona depois que mexe na scrollview horizontal e clica em alguma outra célula
                                        verMaisHistoria = sobreNos
                                        verMais.toggle()
                                    }
                                    .frame(width: 300, height: 200)
                                    
                                }
                                .background(Color.white)
                                .border(Color.gray, width: 0.5)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 3, x: 0, y: 1)
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                //.navigationBarTitle("", displayMode: .inline)
            }
        }.sheet(isPresented: $verMais) {
            VerMaisView(historia: $verMaisHistoria, verMais: $verMais)
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

