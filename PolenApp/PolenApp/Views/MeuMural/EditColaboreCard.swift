//
//  EditColaboreCard.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 06/12/20.
//

import SwiftUI
import CloudKit

struct EditColaboreCard: View {
    @Binding var titulo: String
    @Binding var instituicaoID: String
    @Binding var editCard: ColaboreCard?
    @Binding var descricao: String
    @Binding var isEditing: Bool
    
    @State private var descriptionHeight: CGFloat = 0
    @Environment(\.managedObjectContext) var viewContext
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase

    @FetchRequest(
        entity: ColaboreCard.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ColaboreCard.titulo, ascending: true)
        ]
    ) var cards: FetchedResults<ColaboreCard>
    
    func saveCard() {
//        for card in cards {
//            print(card.titulo)
//            print("Titulo antigo: " + tituloAntigo)
//            if (card.titulo == tituloAntigo){
//                card.titulo = titulo
//                card.descricao = descricao
//
//                do {
//                    print("entrou no if")
//                    print(card.titulo)
//                    try self.viewContext.save()
//                } catch {
//                    print("não foi possível salvar")
//                }
//            }
//        }
        CKInstituicao.fetchColabore(instituicaoID: CKRecord.ID(recordName: instituicaoID)) { results in
            switch results {
            case .success(let colaboreCards):
                for card in colaboreCards {
                    if card.name == editCard?.titulo {
                        publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: card.id)) { (record, error) in
                            if let fetchedInfo = record {
                                fetchedInfo["CD_titulo"] = titulo
                                fetchedInfo["CD_descricao"] = descricao
                                
                                publicDatabase.save(fetchedInfo) {  _, _ in
                                    editCard?.titulo = titulo
                                    editCard?.descricao = descricao
                                    
                                    do {
                                        try self.viewContext.save()
                                    } catch {
                                        print("não foi possível salvar")
                                    }
                                }
                            } else {
                                print("failure on fetching user historia from icloud: \(String(describing: error))")
                            }
                        }
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    var saveStory: some View {
        Button(action: {
            saveCard()
            isEditing.toggle()
            
        }, label: {
            Text("Salvar")
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
            Text("Editar Publicação")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
                .padding(.top,30)

            TextField("", text: $titulo)
                .padding()
                .foregroundColor(.black)
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            DynamicHeightTextField(text: $descricao, height: $descriptionHeight)
                .padding()
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            saveStory
        }
    }
}

//struct EditColaboreCard_Previews: PreviewProvider {
//    static var previews: some View {
//        EditColaboreCard()
//    }
//}
