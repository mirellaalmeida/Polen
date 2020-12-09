////
////  Login.swift
////  PolenApp
////
////  Created by Mirella Almeida on 16/11/20.
////
//
//import SwiftUI
//
//struct Login: View {
//    //ACHO QUE DADOS DE LOGIN DEVEM SER ADICIONADOS À INSTITUIÇÃO OU COMO UM RELACIONAMENTO
//    //A partir dos dados do login, pegaremos a id da instituição e mandaremos pra Meu Mural (a id vai ser
//    //meio que uma variável global entre todas as telas
//    @Environment(\.managedObjectContext) var viewContext
//    @Environment(\.presentationMode) var presentationMode
//    
//    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
//    
//    //@State private var id = ""
//    @State private var nome:String = ""
//    @State private var descricao:String = ""
//    @State private var cidade: String = ""
//    @State var addedInst = false
//    @State var testView = false
//    
//    @Binding var instituicaoID: String
//    
//    var body: some View{
//        VStack {
//            TextField("Nome", text: $nome)
//                .foregroundColor(.black)
//                .background(Color(UIColor.secondarySystemBackground))
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            TextField("Descrição", text: $descricao)
//                .foregroundColor(.black)
//                .background(Color(UIColor.secondarySystemBackground))
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            TextField("Cidade", text: $cidade)
//                .foregroundColor(.black)
//                .background(Color(UIColor.secondarySystemBackground))
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            NavigationLink(destination: MeuMural(instituicaoID: $instituicaoID), isActive: $addedInst){
//                EmptyView()
//            }
//            
//            Button(action: {
//                let newInstituicao = Instituicao(context: viewContext)
//                newInstituicao.id = UUID().uuidString
//                newInstituicao.nome = nome
//                newInstituicao.descricao = descricao
//                newInstituicao.cidade = cidade
//                
//                self.instituicaoID = newInstituicao.id!
//                
//                do {
//                    try self.viewContext.save()
//                    print("Salvo")
//                } catch {
//                    print("não foi possível salvar")
//                }
//                
//                self.addedInst.toggle()
//            }, label: {
//                Text("Adicionar Instituição")
//            })
//            .padding()
//            .border(Color.purple, width: 2)
//            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
//            
//            Button(action: {
//                testView.toggle()
//            }, label: {
//                Text("Testar Persistência")
//            })
//            
//            Spacer()
//        }
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(false)
//        .sheet(isPresented: $testView){
//            List{
//                ForEach(instituicoes, id: \.self){instituicao in
//                    NavigationLink(destination: MeuMural(instituicaoID: $instituicaoID), isActive: $addedInst) {
//                        Text(instituicao.wrappedNome)
//                            .font(.title)
//                            .fontWeight(.bold)
//                    }
//                    .onTapGesture {
//                        self.instituicaoID = instituicao.id!
//                        self.addedInst.toggle()
//                        self.testView.toggle()
//                    }
//                }.onDelete(perform: { indexSet in
//                    for index in indexSet {
//                        let instituicao = instituicoes[index]
//                        viewContext.delete(instituicao)
//                    }
//                    do {
//                        try self.viewContext.save()
//                    } catch {
//                        print("não foi possível salvar")
//                    }
//                })
//            }
//        }
//        .navigationBarHidden(false)
//        
//    }
//}
//
////struct Login_Previews: PreviewProvider {
////    static var previews: some View {
////        Login()
////    }
////}
