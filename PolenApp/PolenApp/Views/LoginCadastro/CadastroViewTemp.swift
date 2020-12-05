//
//  Cadastro.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
import AuthenticationServices
import CloudKit


struct CadastroViewTemp: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var login = UserDefaults.standard.bool(forKey: "isLogged")
    //@State var name = ""
    //@State var loginIsActive = false
    @State var instituicaoID: String = ""
    
    //@State var actionSheetIsActive = false
    @State var alertIsActive = false
    @State var cadastoIsActive = false
    
    //@FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    private let dataUser = UserDefaults.standard
    
    var body: some View {
        VStack {
            /*Button(action: {
             for instituicao in instituicoes {
             print(instituicao.wrappedNome)
             }
             }, label: {Text("Teste")})*/
            
            let userID = dataUser.object(forKey: "userID") as? String
            
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
                                    
                                    //Cria user no user defaults para a instituição
                                    UserDefaults.standard.set(userAppleID, forKey: "userID")
                                    
                                    instituicaoID = userAppleID
                                    
                                    publicDatabase.save(record) { _, _ in
                                        UserDefaults.standard.set(record.recordID.recordName, forKey: "CD_id")
                                    }
                                    
                                    UserDefaults.standard.set(true, forKey: "isLogged")
                                    
                                    self.login = true
                                    
                                    NavigationLink(
                                        destination: CadastroView(),
                                        isActive: $cadastoIsActive) {
                                        EmptyView()
                                    }
                                    self.cadastoIsActive.toggle()
                                    
                                } else {
                                    //singIn
                                    publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: userAppleID)) { (record, error) in
                                        
                                        if let fetchedInfo = record {
                                            instituicaoID = (fetchedInfo["id"] as? String)!
                                            
                                            UserDefaults.standard.set(userAppleID, forKey: "userID")
                                            
                                            UserDefaults.standard.set(true, forKey: "isLogged")
                                            
                                            self.login = true
                                            
                                            //chama meu mural
                                        }
                                        
                                        else {
                                            print("failure on fetching user data from icloud: \(String(describing: error))")
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
                
            } else if login {
                //Login(instituicaoID: $instituicaoID, loginIsActive: .constant(true))
                //Ir para Meu Mural
                Button(action: {print("here")}, label: {
                    Text("Teste")
                })
            }
        }
        .alert(isPresented: $alertIsActive) {
            Alert(title: Text("Gostaria de cadastrar uma instituição?"),
                  message: Text("O 'Meu Mural' é de acesso restrito a instituições."),
                  primaryButton: .default(Text("Sim"), action: {
                    Text("Teste")
                  }),
                  secondaryButton: .default(Text("Não"), action: {
                    self.alertIsActive.toggle()
                  })
            )
        }
    }
}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        CadastroViewTemp()
    }
}
