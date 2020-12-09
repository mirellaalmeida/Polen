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
    //@State var name = ""
    @State var instituicaoID: String = ""
    
    @State var cadastroIsActive = false
    @State var alertIsActive = false
    @State var alert2IsActive = false
    @State var muralIsActive = false
    //@State var dataIsSaved = false
    
    //@FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    private let userData = UserDefaults.standard
    
    var body: some View {
        VStack {
            /*Button(action: {
             for instituicao in instituicoes {
             print(instituicao.wrappedNome)
             }
             }, label: {Text("Teste")})*/
            
            let userID = userData.object(forKey: "userID") as? String
            
            NavigationLink(
                destination: CadastroView1(instituicaoID: $instituicaoID, cadastroIsActive: $cadastroIsActive),
                isActive: $cadastroIsActive) {
                EmptyView()
            }
            
            NavigationLink(destination: MeuMural(instituicaoID: $instituicaoID), isActive: $muralIsActive) {
                EmptyView()
            }
            
            if (!login) && (userID == nil) {
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
                                
                                if appleIDCredential.email != nil {
                                    //singUp
                                    
                                    //Cria Instituição na Nuvem
                                    let record = CKRecord(recordType: "CD_Instituicao",
                                                          recordID: CKRecord.ID(recordName: userAppleID))
                                    record["CD_id"] = record.recordID.recordName
                                    
                                    publicDatabase.save(record) { _, _ in
                                        //Salva localmente
                                        saveLocalInfos(record: record)
                                    }
                                    
                                    UserDefaults.standard.set(true, forKey: "isLogged")
                                    
                                    self.cadastroIsActive.toggle()
                                    
                                } else {
                                    //singIn
                                    publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: userAppleID)) { (record, error) in
                                        if let fetchedInfo = record {
                                            fetchRemoteInfos(record: fetchedInfo)
                                            
                                            //print(instituicaoID)
                                            
                                            self.muralIsActive.toggle()
                                        } else {
                                            print("failure on fetching user data from icloud: \(String(describing: error))")
                                            
                                            self.alertIsActive.toggle()
                                        }
                                    }
                                }
                                
                            default:
                                print("failure on fetching user's credentials")
                            //break
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
                
            } else {
                HStack{
                   VStack {
                        Text("Desculpa, mas tivemos alguns problemas internos, por favor atualize a página.")
                        
                        Button(action: {
                            loadInstituicoes()
                            
                        }, label: {
                            Text("Atualizar Página")
                        })
                    }
                }
               
                
            }
        }
    }
    
    private func saveLocalInfos(record: CKRecord) {
        UserDefaults.standard.set(record.recordID.recordName, forKey: "userID")
        
        let newInstituicao = Instituicao(context: viewContext)
        newInstituicao.id = record.recordID.recordName as String
        
        instituicaoID = newInstituicao.id!
        
        do {
            try self.viewContext.save()
        } catch {
            print("não foi possível salvar")
        }
    }
    
    private func fetchRemoteInfos(record: CKRecord) {
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
                self.instituicaoID = newInstituicoes.last!
                
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
