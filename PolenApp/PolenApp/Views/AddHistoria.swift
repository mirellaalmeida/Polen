//
//  AddHistoria.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 23/11/20.
//

import SwiftUI

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
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicSizeTextField: self)
    }
}

class Coordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    
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
    
    @Binding var isAdding: Bool
    
    @State var title: String = ""
    @State var description: String = ""
    @State var descriptionHeight: CGFloat = 0
    
    var textFieldHeight: CGFloat {
        let minHeight: CGFloat = 30
        let maxHeight: CGFloat = 500
        
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
            //Colocar título da página
            
            Text("Aqui vai ficar o adicionar imagem!")
                .padding()
            
            /*TextField("Título Aqui", text: $title)
                .foregroundColor(.black)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .frame(width: 500, height: 100)
            
            ZStack(alignment: .topLeading){
                Color(UIColor.secondarySystemBackground)
                
                if description.isEmpty{
                    Text("Descrição Aqui")
                        .foregroundColor(Color(UIColor.placeholderText))
                        .padding(4)
                }
                
                DynamicHeightTextField(text: $description, height: $descriptionHeight)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .frame(width: 500, height: descriptionHeight)*/
            
            //testar tirar do form e colocar na vstack
            Form{
                Section(header: Text("Título")){
                    TextField("Título Aqui", text: $title)
                        .foregroundColor(.black)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .frame(width: 300, height: descriptionHeight)
                }
                
                Section(header: Text("Descrição")){
                    ZStack(alignment: .topLeading){
                        Color(UIColor.secondarySystemBackground)
                        
                        if description.isEmpty{
                            Text("Descrição Aqui")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(4)
                        }
                        
                        DynamicHeightTextField(text: $description, height: $descriptionHeight)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .frame(width: 300, height: descriptionHeight)
                }
            }
            .padding()
            .onAppear{
                UITableView.appearance().backgroundColor = .clear
            }
            .foregroundColor(.white)
            .background(Color.white)
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
