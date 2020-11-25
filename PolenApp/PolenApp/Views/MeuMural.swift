//
//  MuralDaInstituicao.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
// swiftlint:disable all

struct MeuMural: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var isActive:Bool
    @Binding var instituicaoID:UUID
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.id, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    init(isActive: Binding<Bool>, instituicaoID: Binding<UUID>) {
        _isActive = isActive
        _instituicaoID = instituicaoID
        
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
    
    @State var verMais = false
    
    @State var addingHistoria = false
    
    @State var verHistoria: HistoriasCard?
    
    var body: some View{
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    BannerMeuMural(instituicaoID: $instituicaoID)
                    
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
                            
                            NavigationLink(destination: AddHistoria(isAdding: self.$addingHistoria, instituicaoID: $instituicaoID),
                                           isActive: $addingHistoria){
                                EmptyView()
                            }
                            
                            Button(action: {
                                self.addingHistoria.toggle()
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .padding()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 10){
                                
                                ForEach (instituicoes.first(where: {$0.id == instituicaoID})?.historiasArray ?? [], id: \.self){ historia in
                                    VStack{
                                        Image(systemName: "star")
                                            .resizable()
                                            .cornerRadius(8.0)
                                            .frame(width: 40, height: 40)
                                        Text(historia.titulo!)
                                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.leading)
                                        Text(historia.descricao!)
                                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(4)
                                    }
                                    .onTapGesture {
                                        //Por algum motivo, só funciona depois que mexe na scrollview horizontal e clica em alguma outra célula
                                        verHistoria = historia
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
                //.navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                //.navigationBarTitle("", displayMode: .inline)
            }
            .navigationBarHidden(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $verMais) {
            //VerMaisView(historia: $verHistoria, verMais: $verMais)
        }
    }
}

/*
#if DEBUG
struct MuralView_Previews: PreviewProvider {
    static var previews: some View {
        MeuMural(isActive: .constant(true))
            .previewDevice("iPhone 11")
    }
}
#endif
*/
