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
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(fetchRequest: Instituicao.getInstituicoesFetchRequest()) var instituicoes: FetchedResults<Instituicao>
    
    @State var alertIsActive = false
    @State var view2IsActive = false
    
    @State var name: String = ""
    @State var description: String = ""
    
    @State var imageProfile: UIImage?
    @State var imageProfileData: Data?
    
    
    @State private var descriptionHeight: CGFloat = 0
    
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    
    //@Binding var instituicaoID: String
    @Binding var isLogged: Bool
    @Binding var userAppleID: String
    
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
                if imageProfile != nil {
                    imageProfileData = imageProfile?.jpegData(compressionQuality: 6)
                }
                
                self.view2IsActive.toggle()
            } else {
                self.alertIsActive.toggle()
            }
        }, label: {
            Text("Próximo")
                .foregroundColor(.white)
                .padding(.horizontal, 40)
        })
        .padding()
        .background(Color("Roxo"))
        .cornerRadius(10)
        .padding(.top)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: CadastroView2(presentation: _presentation,
                                               imageProfileData: $imageProfileData, 
                                               name: $name,
                                               description: $description,
                                               isLogged: $isLogged,
                                               userAppleID: $userAppleID),
                    
                    isActive: $view2IsActive) {
                    EmptyView()
                }
                
                Text("Crie uma conta")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    
                
                Text("Faça parte da nossa comunidade online!")
                    .font(.subheadline)
                    //.fontWeight(.ultraLight)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                ImagePickerView(image: $imageProfile)
                    .padding()
                
                addNome
                
                addDescricao
                
                nextButton
            }
            .alert(isPresented: $alertIsActive, content: {
                Alert(title: Text("Atenção"), message: Text("Todos os campos devem ser preenchidos"), dismissButton: .cancel(Text("Voltar")))
            })
            .background(
                Image("backgroundTexture")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
        }
       .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CadastroView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView1(isLogged: .constant(false), userAppleID: .constant(""))
    }
}
