//
//  MeuMuralController.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 06/12/20.
//

import SwiftUI

struct MeuMuralController: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var instituicaoID: String = ""
    
    @State var actionSheetIsActive = true
    @State var alertIsActive = false
    @State var loginIsActive = false
    
    private let userID = UserDefaults.standard.object(forKey: "userID") as? String
    
    @State var login = UserDefaults.standard.bool(forKey: "isLogged")
    
    var body: some View {
        if (!login) && (userID == nil) {
            Image("launchScreenPolen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
                .actionSheet(isPresented: $actionSheetIsActive, content: {
                    ActionSheet(title: Text("Você possui uma instituição cadastrada?"),
                                message: Text("O 'Meu Mural' é de acesso restrito a instituições."),
                                buttons: [
                                    .default(Text("Sim"), action: {
                                        self.loginIsActive.toggle()
                                    }),
                                    .default(Text("Não"), action: {
                                        self.alertIsActive.toggle()
                                    })
                                    
                                    
                                ])
                })
                .alert(isPresented: $alertIsActive) {
                    Alert(title: Text("Gostaria de cadastrar uma instituição?"),
                          message: Text("O 'Meu Mural' é de acesso restrito a instituições."),
                          primaryButton: .default(Text("Sim"), action: {
                            loginIsActive.toggle()
                          }),
                          secondaryButton: .default(Text("Não"), action: {
                            self.alertIsActive.toggle()
                          })
                    )
                }
                .accentColor(Color("Roxo"))
        } 
//        if (!login) && (userID == nil) {
//            self.actionSheetIsActive.toggle()
//        } else {
//            MeuMural(instituicaoID: .constant(instituicoes.first(where: {$0.id == instituicaoID})?.wrappedID ?? "Not Found"))
//                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
//        }
        
        
    }
}

struct MeuMuralController_Previews: PreviewProvider {
    static var previews: some View {
        MeuMuralController()
    }
}
