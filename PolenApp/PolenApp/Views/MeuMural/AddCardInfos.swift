//
//  AddCardInfos.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 30/11/20.
//

import SwiftUI

struct AddCardInfos: View {
    @Binding var title: String
    @Binding var description: String
    @State private var descriptionHeight: CGFloat = 0
    
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
    
    
    var addTitle: some View {
        TextField("Título", text: $title)
            .foregroundColor(.black)
            .background(Color(UIColor.secondarySystemBackground))
            .padding([.leading, .trailing])
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    var addDescription: some View {
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
    }
    
    var body: some View {
        addTitle
        
        addDescription
    }
}

