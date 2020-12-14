//
//  CadastroView3.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 06/12/20.
//

import SwiftUI
import CloudKit

private var tags: [String:Bool] = [:]

struct CadastroView3: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var instituicaoID: String = ""
    
    @State var meuMural = false
    @State var isChecked = false
    
    @Binding var imageProfileData: Data?
    @Binding var name: String
    @Binding var description: String
    
//    @Binding var rua: String
//    @Binding var bairro: String
    @Binding var cidade: String
//    @Binding var cep: String
    
    @Binding var telefone: String
    @Binding var email: String
    @Binding var facebook: String
    @Binding var instagram: String
    @Binding var site: String
    
    @Binding var isLogged: Bool
    @Binding var userAppleID: String
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    
    var checkboxes: some View {
        VStack {
            CheckBoxField(label: "Educação", callback: checkboxSelected)
            CheckBoxField(label: "Alimentação", callback: checkboxSelected)
            CheckBoxField(label: "Moradia", callback: checkboxSelected)
            CheckBoxField(label: "Jurídico", callback: checkboxSelected)
            CheckBoxField(label: "Saúde", callback: checkboxSelected)
            CheckBoxField(label: "Trabalho", callback: checkboxSelected)
            CheckBoxField(label: "Mulheres", callback: checkboxSelected)
            CheckBoxField(label: "Religião", callback: checkboxSelected)
            CheckBoxField(label: "LGBTQIA+", callback: checkboxSelected)
        }
    }
    
    
    var saveButton: some View {
        Button(action: {
            //Cria Instituição na Nuvem
            let record = CKRecord(recordType: "CD_Instituicao",
                                  recordID: CKRecord.ID(recordName: userAppleID))
            record["CD_id"] = record.recordID.recordName
            
            publicDatabase.save(record) { _, _ in
                //Salva localmente
                saveLocalInfos(record: record)
            }
            
            
            UserDefaults.standard.set(true, forKey: "isLogged")
            
            self.isLogged.toggle()
            
            presentation.wrappedValue.dismiss()
            
        }, label: {
            Text("Salvar")
        })
        .padding(.top, 50)
    }
    
    
    var body: some View {
        ScrollView(.vertical){
            
            VStack {
                Text("Estamos quase lá!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                
                Text("Nos ajude a entender os pilares da sua instituição selecionando as caixas abaixo que se enquadrem com as atividades da sua instituição")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                    .padding(.top, 5)
                    .padding([.leading, .trailing], 70)
                
                checkboxes
                
                saveButton
                
                Spacer()
            }
        }
    }
    
    func checkboxSelected(label: String, isChecked: Bool) {
        print("\(label) is checked: \(isChecked)")
    }
    
    private func saveLocalInfos(record: CKRecord) {
        UserDefaults.standard.set(record.recordID.recordName, forKey: "userID")
        
        let newInstituicao = Instituicao(context: viewContext)
        newInstituicao.id = record.recordID.recordName as String
        
        instituicaoID = newInstituicao.id!
        
        viewContext.refresh(newInstituicao, mergeChanges: true)
        
        publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: instituicaoID)) { (record, error) in
            if let fetchedInfo = record {
                fetchedInfo.setValue(name, forKey: "CD_nome")
                fetchedInfo.setValue(description, forKey: "CD_descricao")
                
                do {
                    let path = NSTemporaryDirectory() + "instituicao_picture_temp_\(UUID().uuidString).jpeg"
                    let url = URL(fileURLWithPath: path)
                    
                    try imageProfileData?.write(to: url)
                    
                    fetchedInfo["CD_imagem_ckAsset"] = CKAsset(fileURL: url)
                    
                } catch {
                    print(error)
                }
                
                publicDatabase.save(fetchedInfo) { _, _ in
                    let instituicao = instituicoes.first(where: {$0.id == instituicaoID})

                    instituicao?.nome = name
                    instituicao?.descricao = description
                    instituicao?.imagem = imageProfileData
                    
                    do {
                        try self.viewContext.save()
                    } catch {
                        print("não foi possível salvar")
                    }
                }
                
                if cidade != "" {
                    fetchedInfo.setValue(cidade, forKey: "CD_cidade")
                    
                    publicDatabase.save(fetchedInfo) { _, _ in
                        newInstituicao.cidade = cidade
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print("não foi possível salvar")
                        }
                    }
                }
                
                if telefone != "" {
                    fetchedInfo.setValue(telefone, forKey: "CD_telefone")
                    
                    publicDatabase.save(fetchedInfo) { _, _ in
                        newInstituicao.telefone = telefone
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print("não foi possível salvar")
                        }
                    }
                }
                
                if email != "" {
                    fetchedInfo.setValue(email, forKey: "CD_email")
                    
                    publicDatabase.save(fetchedInfo) { _, _ in
                        newInstituicao.email = email
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print("não foi possível salvar")
                        }
                    }
                }
                
                if facebook != "" {
                    fetchedInfo.setValue(facebook, forKey: "CD_facebook")
                    
                    publicDatabase.save(fetchedInfo) { _, _ in
                        newInstituicao.facebook = facebook
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print("não foi possível salvar")
                        }
                    }
                }
                
                if instagram != "" {
                    fetchedInfo.setValue(instagram, forKey: "CD_instagram")
                    
                    publicDatabase.save(fetchedInfo) { _, _ in
                        newInstituicao.instagram = instagram
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print("não foi possível salvar")
                        }
                    }
                }
                
                if site != "" {
                    fetchedInfo.setValue(site, forKey: "CD_site")
                    
                    publicDatabase.save(fetchedInfo) { _, _ in
                        newInstituicao.site = site
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print("não foi possível salvar")
                        }
                    }
                }
            }
        }

        
        do {
            try self.viewContext.save()
        } catch {
            print("não foi possível salvar")
        }
    }
}

struct CheckBoxField: View {
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()
    
    @State var isChecked: Bool = false
    
    init(label: String, size: CGFloat = 18, color: Color = Color.purple, textSize: Int = 15, callback: @escaping (String, Bool)->()) {
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }
    
    var body: some View {
        HStack {
            Button(action: {
                self.isChecked.toggle()
                tags[label] = isChecked
                print(tags)
                
            }, label: {
                if self.isChecked {
                    Image(systemName: "checkmark.square.fill")
                        //.renderingMode(.none)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.size, height: self.size)
                        .background(Color(.white))
                        .foregroundColor(color)
                    
                } else {
                    Image(systemName: "square")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.size, height: self.size)
                }
            })
            
            Text(label)
                .font(Font.system(size: size))
            
            Spacer()
        }
        .padding()
    }
}

struct CadastroView3_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView3(imageProfileData: .constant(UIImage().jpegData(compressionQuality: 6)),
                      name: .constant(" "),
                      description: .constant(" "),
                      cidade: .constant(" "),
                      telefone: .constant(" "),
                      email: .constant(" "),
                      facebook: .constant(" "),
                      instagram: .constant(" "),
                      site: .constant(" "),
                      isLogged: .constant(false),
                      userAppleID: .constant(" "))
    }
}
