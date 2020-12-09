//
//  CadastroView2.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 06/12/20.
//

import SwiftUI
import CloudKit

struct CadastroView2: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var view3IsActive = false
    
    @State var cidade = ""
    @State var telefone = ""
    @State var email = ""
    @State var facebook = ""
    @State var instagram = ""
    @State var site = ""
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    @Binding var instituicaoID: String
    @Binding var cadastroIsActive: Bool
    
    var addAddress: some View {
        TextField("Endereço ou cidade", text: $cidade)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    var addPhone: some View {
        TextField("Telefone para contato", text: $telefone)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.telephoneNumber)
            .keyboardType(/*@START_MENU_TOKEN@*/.phonePad/*@END_MENU_TOKEN@*/)
    }
    
    var addEmail: some View {
        TextField("Email", text: $email)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.emailAddress)
            .keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/)
    }
    
    var addFacebook: some View {
        TextField("Link para o Facebook", text: $facebook)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(/*@START_MENU_TOKEN@*/.URL/*@END_MENU_TOKEN@*/)
    }
    
    var addInstagram: some View {
        TextField("Link para o Instagram", text: $instagram)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.URL)
            .keyboardType(/*@START_MENU_TOKEN@*/.URL/*@END_MENU_TOKEN@*/)
    }
    
    var addWebsite: some View {
        TextField("Link para o site", text: $site)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.URL)
            .keyboardType(/*@START_MENU_TOKEN@*/.URL/*@END_MENU_TOKEN@*/)
    }
    
    var nextButton: some View {
        Button(action: {
            publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: instituicaoID)) { (record, error) in
                if let fetchedInfo = record {
                    let instituicao = instituicoes.first(where: {$0.id == instituicaoID})
                    
                    if cidade != "" {
                        fetchedInfo.setValue(cidade, forKey: "CD_cidade")
                        
                        publicDatabase.save(fetchedInfo) { _, _ in
                            instituicao?.cidade = cidade
                            
                            saveLocalInfos()
                        }
                    }
                    
                    if telefone != "" {
                        fetchedInfo.setValue(telefone, forKey: "CD_telefone")
                        
                        publicDatabase.save(fetchedInfo) { _, _ in
                            instituicao?.telefone = telefone
                            
                            saveLocalInfos()
                        }
                    }
                    
                    if email != "" {
                        fetchedInfo.setValue(email, forKey: "CD_email")
                        
                        publicDatabase.save(fetchedInfo) { _, _ in
                            instituicao?.email = email
                            
                            saveLocalInfos()
                        }
                    }
                    
                    if facebook != "" {
                        fetchedInfo.setValue(facebook, forKey: "CD_facebook")
                        
                        publicDatabase.save(fetchedInfo) { _, _ in
                            instituicao?.facebook = facebook
                            
                            saveLocalInfos()
                        }
                    }
                    
                    if instagram != "" {
                        fetchedInfo.setValue(instagram, forKey: "CD_instagram")
                        
                        publicDatabase.save(fetchedInfo) { _, _ in
                            instituicao?.instagram = instagram
                            
                            saveLocalInfos()
                        }
                    }
                    
                    if site != "" {
                        fetchedInfo.setValue(site, forKey: "CD_site")
                        
                        publicDatabase.save(fetchedInfo) { _, _ in
                            instituicao?.site = site
                            
                            saveLocalInfos()
                        }
                    }
                }
            }
            
            self.view3IsActive.toggle()
            
        }, label: {
            Text("Próximo")
        })
        .padding(.top, 50)
    }
    
    var body: some View {
        NavigationLink(
            destination: CadastroView3(instituicaoID: $instituicaoID, cadastroIsActive: $cadastroIsActive),
            isActive: $view3IsActive) {
            EmptyView()
        }
        
        VStack {
            Text("Adicione mais algumas informações para ajudar sua instituição a se conectar com a rede!")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 70)
            
            addAddress
            
            addPhone
            
            addEmail
            
            addFacebook
            
            addInstagram
            
            addWebsite
            
            nextButton
            
            Spacer()
        }
    }
    
    func saveLocalInfos() {
        do {
            try self.viewContext.save()
            print("Salvo")
        } catch {
            print("não foi possível salvar")
        }
    }
}

//struct CadastroView2_Previews: PreviewProvider {
//    static var previews: some View {
//        CadastroView2(instituicaoID: .constant("D246BE18-3657-4E3A-8C6C-5712B8AAEFAF"))
//    }
//}
