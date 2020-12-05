//
//  CadastroView.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 03/12/20.
//

import SwiftUI
import CloudKit

struct CadastroView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @State var instituicoes: [String] = []
    
    @State var testView = false
    
    @State private var nome:String = ""
    @State private var email:String = ""
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    
    var addNome: some View {
        TextField("Nome", text: $nome)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    var addEmail: some View {
        TextField("Email", text: $email)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    var signUpButton: some View {
        Button(action: {
            if !nome.isEmpty {
                let record = CKRecord(recordType: "CD_Instituicao", recordID: CKRecord.ID(recordName: email))
                record["CD_nome"] = nome
                
                let publicDatabase = CKContainer.default().publicCloudDatabase
                
                publicDatabase.save(record) { _, _ in
                    do {
                        try self.viewContext.save()
                        print("Salvo")
                    } catch {
                        print("não foi possível salvar")
                    }
                }
            }
            
        }, label: {
            Text("Sign Up")
        })
        .padding()
    }
    
    var seeInst: some View {
        Button(action: {
            loadInstituicoes()
            testView.toggle()
        }, label: {
            Text("Testar Persistência")
        })
        .padding()
    }
    
    var body: some View {
        VStack {
            addNome
            
            addEmail
            
            signUpButton
            
            seeInst
        }
        .sheet(isPresented: $testView) {
            List {
                ForEach(instituicoes, id: \.self) {instituicao in
                    Text(instituicao)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }
    private func loadInstituicoes() {
        CKInstituicao.fetch { results in
            switch results {
            case .success(let newInstituicoes):
                self.instituicoes = newInstituicoes
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct CadastroView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView()
    }
}
