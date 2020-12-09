//
//  CadastroView1.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 03/12/20.
//

import SwiftUI
import CloudKit

struct CadastroView1: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    //@State var instituicoes: [String] = []
    
    //@State var testView = false
    @State var alertIsActive = false
    @State var view2IsActive = false
    
    @State private var name:String = ""
    @State private var description:String = ""
    
    
    @State private var descriptionHeight: CGFloat = 0
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    
    @Binding var instituicaoID: String
    @Binding var cadastroIsActive: Bool
    
    var addNome: some View {
        TextField("Nome da Instituição*", text: $name)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    var textFieldHeight: CGFloat {
        let minHeight: CGFloat = 30
        let maxHeight: CGFloat = 100
        
        if descriptionHeight < minHeight {
            return minHeight
        }
        
        if descriptionHeight > maxHeight {
            return maxHeight
        }
        
        return descriptionHeight
    }
    
    var addDescricao: some View {
        ZStack(alignment: .topLeading){
            Color.white
            
            if description.isEmpty{
                Text("Descrição*")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(7)
            }
            
            DynamicHeightTextField(text: $description, height: $descriptionHeight)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
        .padding([.leading, .trailing])
    }
    
    var nextButton: some View {
        Button(action: {
            if !name.isEmpty && !description.isEmpty {
                publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: instituicaoID)) { (record, error) in
                    if let fetchedInfo = record {
                        fetchedInfo.setValue(name, forKey: "CD_nome")
                        fetchedInfo.setValue(description, forKey: "CD_descricao")

                        publicDatabase.save(fetchedInfo) { _, _ in
                            let instituicao = instituicoes.first(where: {$0.id == instituicaoID})

                            instituicao?.nome = name
                            instituicao?.descricao = description

                            do {
                                try self.viewContext.save()
                                print("Salvo")
                            } catch {
                                print("não foi possível salvar")
                            }
                        }
                    }
                }
                self.view2IsActive.toggle()
            } else {
                self.alertIsActive.toggle()
            }
        }, label: {
            Text("Próximo")
        })
        .padding()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: CadastroView2(instituicaoID: $instituicaoID, cadastroIsActive: $cadastroIsActive),
                    isActive: $view2IsActive) {
                    EmptyView()
                }
                .navigationBarHidden(true)
                Text("Crie uma conta")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                
                Text("Faça parte da nossa comunidade online!")
                    .font(.subheadline)
                    //.fontWeight(.ultraLight)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                ImagePickerView()
                    .padding()
                
                addNome
                
                addDescricao
                
                nextButton
            }
            .alert(isPresented: $alertIsActive, content: {
                Alert(title: Text("Atenção"), message: Text("Todos os campos devem ser preenchidos"), dismissButton: .cancel(Text("Voltar")))
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //        .sheet(isPresented: $testView) {
        //            List {
        //                ForEach(instituicoes, id: \.self) {instituicao in
        //                    Text(instituicao)
        //                        .font(.title)
        //                        .fontWeight(.bold)
        //                }
        //            }
        //        }
        //    }
        //    private func loadInstituicoes() {
        //        CKInstituicao.fetch { results in
        //            switch results {
        //            case .success(let newInstituicoes):
        //                self.instituicoes = newInstituicoes
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
        //    }
    }
}

//struct CadastroView_Previews: PreviewProvider {
//    static var previews: some View {
//        CadastroView1(instituicaoID: .constant("D246BE18-3657-4E3A-8C6C-5712B8AAEFAF"))
//    }
//}
