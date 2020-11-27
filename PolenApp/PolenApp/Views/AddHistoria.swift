//
//  AddHistoria.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 23/11/20.
//

import SwiftUI

//DynamicHeightTextField e Coordinator são usadas para construir a textview(textfield grande)
struct DynamicHeightTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.isScrollEnabled = true
        textView.alwaysBounceVertical = false
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        
        textView.text = text
        textView.backgroundColor = UIColor.clear
        textView.layer.borderWidth = 5
        textView.layer.borderColor = UIColor.systemBackground.cgColor
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    
    func makeCoordinator() -> TextCoordinator {
        return TextCoordinator(dynamicSizeTextField: self)
    }
}

class TextCoordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    
    var dynamicHeightTextField: DynamicHeightTextField
    
    weak var textView: UITextView?
    
    
    init(dynamicSizeTextField: DynamicHeightTextField) {
        self.dynamicHeightTextField = dynamicSizeTextField
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.dynamicHeightTextField.text = textView.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        /*if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }*/
        return true
    }
    
    func layoutManager(_ layoutManager: NSLayoutManager, didCompleteLayoutFor textContainer: NSTextContainer?, atEnd layoutFinishedFlag: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let textView = self?.textView else {
                return
            }
            let size = textView.sizeThatFits(textView.bounds.size)
            if self?.dynamicHeightTextField.height != size.height {
                self?.dynamicHeightTextField.height = size.height
            }
        }
        
    }
}

struct AddHistoria: View {
    @Environment(\.managedObjectContext) var viewContext
    @Binding var instituicaoID: UUID
    @Binding var isAdding: Bool
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var descriptionHeight: CGFloat = 0
    
    @FetchRequest(
        entity: Instituicao.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Instituicao.nome, ascending: true)
        ]
    ) var instituicoes: FetchedResults<Instituicao>
    
    var textFieldHeight: CGFloat {
        let minHeight: CGFloat = 30
        let maxHeight: CGFloat = 400
        
        if descriptionHeight < minHeight {
            return minHeight
        }
        
        if descriptionHeight > maxHeight {
            return maxHeight
        }
        
        return descriptionHeight
    }
    
    var body: some View {
        VStack{
            Text("Adicionar Publicação")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            Text("Aqui vai ficar o adicionar imagem!")
                .padding()
            
            TextField("Título", text: $title)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ZStack(alignment: .topLeading){
                Color.white
                
                if description.isEmpty{
                    Text("Descrição")
                        .foregroundColor(Color(UIColor.placeholderText))
                        .padding(4)
                }
                
                DynamicHeightTextField(text: $description, height: $descriptionHeight)
            }
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
            .padding([.leading, .trailing])
            
            Spacer()
            
            Button(action: {
                let newStory = HistoriasCard(context: viewContext)
                newStory.titulo = title
                newStory.descricao = description
                newStory.daInstituicao = instituicoes.first(where: {$0.id == instituicaoID})
                
                do {
                    try self.viewContext.save()
                } catch {
                    print("não foi possível salvar")
                }
                
                self.isAdding.toggle()
                
            }, label: {
                Text("Publicar")
                    .padding()
            })
            
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
