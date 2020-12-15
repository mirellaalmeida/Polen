//
//  Cadastro.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
import AuthenticationServices
import CloudKit


struct LoginView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State private var login = UserDefaults.standard.bool(forKey: "isLogged")
    @State var instituicaoID: String = ""
    
    @State var cadastroIsActive = false
    @State var alertIsActive = false
    @State var alert2IsActive = false
    @State var muralIsActive = false
    
    @State var userID: String = ""
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    
    private let userData = UserDefaults.standard
    
    var header: some View{
        VStack{
            
            HStack {
                Spacer()
                Image("butterfly")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
            
            
            Text("Bem vinde de volta,faça o login para continuar, ou crie uma nova conta.")
                .font(.subheadline)
                //.fontWeight(.ultraLight)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom)
        }
        
    }
    
    var body: some View {
        VStack {
            let instID = userData.object(forKey: "userID") as? String
            
            NavigationLink(destination: MeuMural(instituicaoID: $instituicaoID), isActive: $muralIsActive) {
                EmptyView()
            }
            
            if (!login) && (instID == nil) {
                
                VStack {
                    header
                        .padding()
                        .padding(.top, 50)
                        .padding(.bottom, 100)
                    
                    
                    SignInWithAppleButton(
                        //Request User Infos
                        onRequest: { request in
                            request.requestedScopes = [.email]
                        },
                        
                        //Lidando com dados do user
                        onCompletion: { result in
                            switch result {
                            case .success(let authResults):
                                switch authResults.credential {
                                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                    
                                    let userAppleID = appleIDCredential.user
                                    userID = userAppleID
                                    
                                    if appleIDCredential.email != nil {
                                        for instituicao in instituicoes {
                                            viewContext.delete(instituicao)
                                        }
                                        
                                        do {
                                            try self.viewContext.save()
                                        } catch {
                                            print("não foi possível salvar")
                                        }
                                        
                                        self.cadastroIsActive.toggle()
                                        
                                    } else {
                                        //singIn
                                        publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: userAppleID)) { (record, error) in
                                            if let fetchedInfo = record {
                                                if instID == nil && record?["CD_nome"] == nil {
                                                    self.cadastroIsActive.toggle()
                                                } else {
                                                    fetchRemoteInfos(record: fetchedInfo)
                                                    
                                                    self.muralIsActive.toggle()
                                                }
                                                
                                            } else {
                                                print("failure on fetching user data from icloud: \(String(describing: error))")
                                                
                                                self.login.toggle()
                                                self.alertIsActive.toggle()
                                            }
                                        }
                                        
                                    }
                                    
                                default:
                                    print("failure on fetching user's credentials")
                                }
                                
                            case .failure(let error):
                                print("failure on fetching user's infos", error)
                            }
                        }
                    )
                    .signInWithAppleButtonStyle(.black)
                    .frame(width: 350, height: 50)
                    .alert(isPresented: $alertIsActive) {
                        Alert(title: Text("Usuário não encontrado!"), dismissButton: .cancel(Text("Ok")))
                    }
                    .padding(.bottom, 100)
                    
                }
                
            } else {
                VStack{
                    HStack {
                        Spacer()
                        Image("butterfly")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                }
                    
                    Text("Seja bem vinde")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                    
                    
                    Text("Sua instituição agora faz parte da nossa rede!")
                        .font(.subheadline)
                        //.fontWeight(.ultraLight)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60)
                    
                    Button(action: {
                        let id = userData.object(forKey: "userID") as? String
                        
                        if (login) && (id != nil) {
                            instituicaoID = id!
                            self.muralIsActive.toggle()
                            
                        } else {
                            loadInstituicoes()
                        }
                        
                    }, label: {
                        Text("Ver Meu Mural")
                            .foregroundColor(.white)
                            .padding()
                        
                    })
                    
                    .background(Color("Roxo"))
                    .cornerRadius(10)
                }
                .background(
                    Image("backgroundLogin")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                
            }
        }
        .background(
            Image("backgroundLogin")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .fullScreenCover(isPresented: $cadastroIsActive) {
            CadastroView1(isLogged: $login, userAppleID: $userID)
        }
    }
    
    private func fetchRemoteInfos(record: CKRecord) {
        UserDefaults.standard.set(record.recordID.recordName, forKey: "userID")
        
        let newInstituicao = Instituicao(context: viewContext)
        newInstituicao.id = record.recordID.recordName as String
        
        instituicaoID = newInstituicao.id!
        
        newInstituicao.nome = record["CD_nome"]
        newInstituicao.descricao = record["CD_descricao"]
        newInstituicao.cidade = record["CD_cidade"]
        newInstituicao.instagram = record["CD_instagram"]
        newInstituicao.telefone = record["CD_telefone"]
        newInstituicao.facebook = record["CD_facebook"]
        newInstituicao.site = record["CD_site"]
        newInstituicao.email = record["CD_email"]
        let asset = record["CD_imagem_ckAsset"] as? CKAsset
        
        if asset != nil {
            let instituicaoImage = NSData(contentsOf: (asset?.fileURL)!)
            newInstituicao.imagem = instituicaoImage! as Data
        }
        
        do {
            try self.viewContext.save()
        } catch {
            print("não foi possível salvar")
        }
    }
    
    private func loadInstituicoes() {
        CKInstituicao.fetch { results in
            switch results {
            case .success(let newInstituicoes):
                self.instituicaoID = newInstituicoes.first ?? newInstituicoes.last ?? " "
                
                self.muralIsActive.toggle()
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
