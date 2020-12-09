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
    
    @Binding var instituicaoID: String
    @Binding var cadastroIsActive: Bool
    
    @State var meuMural = false
    @State var isChecked = false
    
    @State var cidade = ""
    @State var telefone = ""
    @State var email = ""
    @State var facebook = ""
    @State var instagram = ""
    @State var site = ""
    
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
            //            publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: instituicaoID)) { (record, error) in
            //                if let fetchedInfo = record {
            //                    let instituicao = instituicoes.first(where: {$0.id == instituicaoID})
            //
            //
            //                }
            //            }
            print(instituicoes.count)
            withAnimation(.easeOut(duration: 0.3)) {
                self.cadastroIsActive.toggle()
            }
            //presentation.wrappedValue.dismiss()
        }, label: {
            Text("Salvar")
        })
        .padding(.top, 50)
    }
    
    
    var body: some View {
        //        NavigationLink(
        //            destination: MeuMural(instituicaoID: $instituicaoID),
        //            isActive: $meuMural) {
        //            EmptyView()
        //        }
        
        //        NavigationLink(
        //            destination: TabBarView(tabViewIsActive: $meuMural),
        //            isActive: $meuMural) {
        //            EmptyView()
        //        }
        
        VStack {
            Text("Estamos quase lá!")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.top)
            
            Text("Nos ajude a entender os pilares da sua instituição selecionando as caixas abaixo que se enquadrem com as atividades da sua instituição")
                .font(.subheadline)
                //.fontWeight(.ultraLight)
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
    
    func checkboxSelected(label: String, isChecked: Bool) {
        print("\(label) is checked: \(isChecked)")
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
        ScrollView(.vertical){
            HStack {
                Button(action: {
                    self.isChecked.toggle()
                    tags[label] = isChecked
                    print(tags)
                    
                }, label: {
                    //HStack(alignment: .center, spacing: 10) {
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
                    //}.foregroundColor(color)
                })
                
                Text(label)
                    .font(Font.system(size: size))
                
                Spacer()
            }
            .padding()
            
        }
    }
    
}

//struct CadastroView3_Previews: PreviewProvider {
//    static var previews: some View {
//        CadastroView3(instituicaoID: .constant("D246BE18-3657-4E3A-8C6C-5712B8AAEFAF"))
//    }
//}
