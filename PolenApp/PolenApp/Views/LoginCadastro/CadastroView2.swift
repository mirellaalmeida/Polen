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
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var view3IsActive = false
    @State var isEditing = false
    
    @Binding var name: String
    @Binding var description: String
    @Binding var isLogged: Bool
    @Binding var userAppleID: String
    
//    @State var rua = ""
//    @State var bairro = ""
    @State var cidade = ""
//    @State var cep = ""
    
    @State var telefone = ""
    @State var email = ""
    @State var facebook = ""
    @State var instagram = ""
    @State var site = ""
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    //@Binding var instituicaoID: String
    
    var addAddress: some View {
        VStack(alignment:.leading) {
            Text("Cidade:")
                .padding([.top, .leading, .trailing])
        
            TextField("Recife-PE", text: $cidade)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding([.bottom, .leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
//            Text("Endereço:")
//                .padding(5)
//
//            Text("Rua e Número:")
//                .padding([.top, .leading])
//                .font(.footnote)
//            TextField("Rua dos Alfeneiros, 04", text: $rua)
//                .foregroundColor(.black)
//                .background(Color(UIColor.secondarySystemBackground))
//                .padding([.bottom, .leading, .trailing])
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Text("Bairro:")
//                .padding([.top, .leading])
//                .font(.footnote)
//            TextField("Boa Vista", text: $bairro)
//                .foregroundColor(.black)
//                .background(Color(UIColor.secondarySystemBackground))
//                .padding([.bottom, .leading, .trailing])
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Text("Cep:")
//                .padding([.top, .leading])
//                .font(.footnote)
//            TextField("50060-900", text: $cep)
//                .foregroundColor(.black)
//                .background(Color(UIColor.secondarySystemBackground))
//                .padding([.bottom, .leading, .trailing])
//                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    var addPhone: some View {
        VStack(alignment:.leading) {
            Text("Telefone para contato:")
                .padding([.top, .leading, .trailing])
            TextField("(99)91234-5678", text: $telefone)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.telephoneNumber)
                .keyboardType(/*@START_MENU_TOKEN@*/.phonePad/*@END_MENU_TOKEN@*/)
        }
    }
    
    var addEmail: some View {
        VStack(alignment:.leading) {
            Text("Email:")
                .padding([.top, .leading, .trailing])
        TextField("minhainstituicao@email.com", text: $email)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.emailAddress)
            .keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/)
        }
    }
    
    var addFacebook: some View {
        VStack(alignment:.leading) {
            Text("Link para o Facebook:")
                .padding([.top, .leading, .trailing])
            TextField("facebook.com/minhainstituicao24", text: $facebook)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.URL)
        }
    }
    
    var addInstagram: some View {
        VStack(alignment:.leading) {
            Text("Link para o Instagram:")
                .padding([.top, .leading, .trailing])
            TextField("instagram.com/minha_instituicao", text: $instagram)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.URL)
                .keyboardType(.URL)
        }
    }
    
    var addWebsite: some View {
        VStack(alignment:.leading) {
            Text("Link para o site:")
                .padding([.top, .leading, .trailing])
            TextField("minhainstituicao.org", text: $site)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.URL)
                .keyboardType(/*@START_MENU_TOKEN@*/.URL/*@END_MENU_TOKEN@*/)
        }
    }
    
    var nextButton: some View {
        Button(action: {
//            publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: instituicaoID)) { (record, error) in
//                if let fetchedInfo = record {
//                    let instituicao = instituicoes.first(where: {$0.id == instituicaoID})
                    
//                    if cidade != "" {
//                        fetchedInfo.setValue(cidade, forKey: "CD_cidade")
//
//                        publicDatabase.save(fetchedInfo) { _, _ in
//                            instituicao?.cidade = cidade
//
//                            saveLocalInfos()
//                        }
//                    }
//
//                    if telefone != "" {
//                        fetchedInfo.setValue(telefone, forKey: "CD_telefone")
//
//                        publicDatabase.save(fetchedInfo) { _, _ in
//                            instituicao?.telefone = telefone
//
//                            saveLocalInfos()
//                        }
//                    }
//
//                    if email != "" {
//                        fetchedInfo.setValue(email, forKey: "CD_email")
//
//                        publicDatabase.save(fetchedInfo) { _, _ in
//                            instituicao?.email = email
//
//                            saveLocalInfos()
//                        }
//                    }
//
//                    if facebook != "" {
//                        fetchedInfo.setValue(facebook, forKey: "CD_facebook")
//
//                        publicDatabase.save(fetchedInfo) { _, _ in
//                            instituicao?.facebook = facebook
//
//                            saveLocalInfos()
//                        }
//                    }
//
//                    if instagram != "" {
//                        fetchedInfo.setValue(instagram, forKey: "CD_instagram")
//
//                        publicDatabase.save(fetchedInfo) { _, _ in
//                            instituicao?.instagram = instagram
//
//                            saveLocalInfos()
//                        }
//                    }
//
//                    if site != "" {
//                        fetchedInfo.setValue(site, forKey: "CD_site")
//
//                        publicDatabase.save(fetchedInfo) { _, _ in
//                            instituicao?.site = site
//
//                            saveLocalInfos()
//                        }
//                    }
//                }
//            }
            
            self.view3IsActive.toggle()
            
        }, label: {
            Text("Próximo")
        })
        .padding(.top, 50)
    }
    
    var body: some View {
        
        NavigationLink(
            destination: CadastroView3(presentation: _presentation,
                                       name: $name,
                                       description: $description,
                                       cidade: $cidade,
                                       telefone: $telefone,
                                       email: $email,
                                       facebook: $facebook,
                                       instagram: $instagram,
                                       site: $site,
                                       isLogged: $isLogged,
                                       userAppleID: $userAppleID),
            
            isActive: $view3IsActive) {
            EmptyView()
        }
        
        ScrollView(.vertical) {
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

struct CadastroView2_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView2(name: .constant(" "), description: .constant(""), isLogged: .constant(false), userAppleID: .constant(""))
    }
}
