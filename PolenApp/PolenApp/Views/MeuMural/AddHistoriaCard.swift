//
//  AddHistoria.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 23/11/20.
//

import SwiftUI
import CloudKit

struct AddHistoriaCard: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var instituicaoID: String
    @Binding var isAdding: Bool
    
    @State var title: String = ""
    @State var description: String = ""
    @State private var descriptionHeight: CGFloat = 0
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    private let userData = UserDefaults.standard
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    func addStory() {
        let userID = (userData.object(forKey: "userID") as? String)!
        
        publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: userID)) { (record, error) in
            if let fetchedInfo = record {
                let newRecord = CKRecord(recordType: "CD_HistoriasCard")
                let reference = CKRecord.Reference(recordID: fetchedInfo.recordID, action: .deleteSelf)
                
                newRecord["CD_titulo"] = title
                newRecord["CD_descricao"] = description
                newRecord["daInstituicao"] = reference as CKRecordValue
                
                var cardsList = fetchedInfo["historiasList"] as? [CKRecord.Reference]
                

                let cardReference = CKRecord.Reference(recordID: newRecord.recordID, action: .none)
                
                if cardsList == nil {
                    cardsList = []
                    cardsList?.append(cardReference)
                } else if !(cardsList?.contains(cardReference))! {
                    cardsList?.append(cardReference)
                } else {
                    print("Didn`t Bind")
                }
                
                fetchedInfo["historiasList"] = cardsList
                publicDatabase.save(fetchedInfo) {  _, _ in
                    publicDatabase.save(newRecord) { _, _ in
                        let newStory = HistoriasCard(context: viewContext)
                        newStory.titulo = title
                        newStory.descricao = description
                        newStory.daInstituicao = instituicoes.first(where: {$0.id == instituicaoID})
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print("não foi possível salvar")
                        }
                    }
                }
                
            } else {
                print("failure on fetching user data from icloud: \(String(describing: error))")
            }
        }
    }
    
    var publishStory: some View {
        Button(action: {
            addStory()
            
            self.isAdding.toggle()
        }, label: {
            Text("Publicar")
                .padding()
                .foregroundColor(.white)
                .padding(.horizontal, 50)
        })
        .background(Color("Roxo"))
        .cornerRadius(10)
        .padding(.top, 25)
        .padding(.bottom, 40)
    }
    
    var body: some View {
        VStack{
            Text("Adicionar Publicação")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
            
            ImagePickerView()
            
            AddCardInfos(title: $title, description: $description)
            
            Spacer()
            
            publishStory
        }
    }
}

/*
 struct AddHistoria_Previews: PreviewProvider {
 static var previews: some View {
 AddHistoria(isAdding: .constant(true))
 }
 }
 */
