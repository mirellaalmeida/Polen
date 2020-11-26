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
    
    @State private var didTap: Bool = false
    
    //    @State var selectableButtonStyle = SelectableButtonStyle()
    
    
    //    var possoAjudarView: some View{
    //        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
    //            Text("Posso ajudar!")
    //                .frame(width: 136, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //                .border(didTap ? Color.clear : (Color("Roxo")), width: 2)
    //                .background(Color("Roxo"))
    //                .background(didTap ? Color("Roxo"): Color.purple)
    //                .foregroundColor(Color(.white))
    //                .font(.system(size:14, weight: .bold))
    //                .cornerRadius(5)
    //        })
    //
    //    }
    
    //    var vaiDarCertoView: some View{
    //        Text("Vai dar certo!")
    //            .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
    //            .frame(width: 136, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //            .border(Color.orange, width: 2)
    //            .cornerRadius(5)
    //            //            .background(Color(#colorLiteral(red: 1, green: 0.4745098039, blue: 0.3098039216, alpha: 1)))
    //            .font(.system(size:14, weight: .bold))
    //
    //
    //    }
    
    var body: some View{
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    BannerView()
                    
                    VStack(alignment: .leading){
                        Text("Colabore conosco")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 15){
                                ForEach (colaboreList){ colabore in  VStack{
                                    Text(colabore.name)
                                        .font(.system(size:16))
                                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                    
                                    
                                    
                                    Text(colabore.description)
                                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                        .padding()
                                    HStack{
                                        DuplaBotoes()
                                    }
                                    
                                }
                                .frame(width: 340, height: 190)
                                
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
                        Text("Um pouco sobre nós")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 18){
                                ForEach (sobreNosList){ sobreNos in
                                    VStack{
                                        Image("Doação")
                                            .resizable()
                                            .cornerRadius(8.0)
                                            .frame(width: 320, height: 200)
                                            .shadow(color: .gray, radius: 0.5, x: 0, y: 0)
                                            .padding()
                                        
                                        Text(sobreNos.title)
                                            .font(.system(size:16, weight: .bold))       .multilineTextAlignment(.leading)
                                            .frame(width: 160, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        
                                        Text(sobreNos.subtitle)
                                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                            .font(.system(size: 12))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(3)
                                            .padding()
                                        Button(action: {didTap.toggle()}, label: {
                                            Text("Ler mais")
                                                .frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .background(Color(#colorLiteral(red: 0.3294117647, green: 0.262745098, blue: 0.6470588235, alpha: 1)))
                                                .foregroundColor(Color(.white))
                                                .font(.system(size:12, weight: .bold))
                                                .cornerRadius(5)
                                            
                                            
                                        })
                                    }
                                    .onTapGesture {
                                        //Por algum motivo, só funciona depois que mexe na scrollview horizontal e clica em alguma outra célula
                                        verMaisHistoria = sobreNos
                                        verMais.toggle()
                                    }
                                    .frame(width: 320, height: 400)
                                    
                                }
                                //                                .background(Color.white)
                                //                                .border(Color.gray, width: 0.5)
                                //                                .cornerRadius(10)
                                //                                .shadow(color: .gray, radius: 3, x: 0, y: 1)
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                    
                }
//                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                //.navigationBarTitle("", displayMode: .inline)
            }
//            .navigationBarHidden(true)
        }
        .navigationBarTitle("Voltar")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $verMais) {
        VerMaisView(historia: $verMaisHistoria, verMais: $verMais)
                                }
        
        .navigationBarItems(trailing:
                    Button("Coração") {
                    print("Help tapped!")
                                }
        )
        //        .background(Color(#colorLiteral(red: 0.9688708186, green: 0.8066166639, blue: 0.3180420101, alpha: 1)).edgesIgnoringSafeArea(.all))
    }
}
struct SelectableButtonStyle: ButtonStyle {
    var isSelected: Bool
    var tint: Color
    var foreGroundColor: Color {
        if isSelected { return .white }
        else { return tint }
    }
    
    var bgColor: Color {
        if isSelected { return tint }
        else { return .clear }
    }
    
    var borderColor: Color {
        if isSelected { return .clear }
        else { return tint}
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 120, height: 13, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(.system(size:14, weight: .bold))
            .padding()
            .foregroundColor(foreGroundColor)
            .background(bgColor)
            .border(borderColor, width: 2)
            .cornerRadius(5)
    }
}

struct DuplaBotoes: View {
    
    enum EstadosBotoes {
        case deselect
        case posso
        case vai
    }
    
    @State var estado: EstadosBotoes = .deselect
    
    var possoCount: Int = 0 // pegou por API, CoreData, sei lá
    
    var exibirPossoCount: Int {
        if estado == .posso {
            return 1 + possoCount
        }
        else {
            return possoCount
        }
    }
    
    var vaiCount: Int = 0
    
    var exibirVaiCount: Int {
        if estado == .vai {
            return 1 + vaiCount
        }
        else {
            return vaiCount
        }
    }
    
    func tentarMudar(para: EstadosBotoes){
        if estado == .deselect {
            estado = para
        } else if estado == para {
            estado = .deselect
        }
    }
    
    var possoAjudarButton: some View {
        Button(action: {
            tentarMudar(para: .posso)
        }) {
            Text("Posso ajudar! (\(exibirPossoCount))")
        }
        .buttonStyle(SelectableButtonStyle(isSelected: estado == .posso, tint: Color("Roxo")))
    }
    
    var vaiDarCertoButton: some View {
        Button(action: {
            tentarMudar(para: .vai)
        }) {
            Text("Vai dar certo! (\(exibirVaiCount))")
        }
        .buttonStyle(SelectableButtonStyle(isSelected: estado == .vai, tint: Color("Laranja")))
    }
    
    var body: some View {
        HStack {
            possoAjudarButton
            
            vaiDarCertoButton
        }
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

