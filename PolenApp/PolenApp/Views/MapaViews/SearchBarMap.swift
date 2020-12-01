//
//  SearchBarMap.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}


struct SearchBarMap: View {
    
    @ObservedObject var bank: BancoInstituicoes
    
    var searchTextField: some View {
        TextField("Search", text: $bank.searchText, onEditingChanged: { isEditing in
            self.bank.isSearching = true
        }, onCommit: {
            print("onCommit")
        }).foregroundColor(.primary)
    }
    
    var cleanTextButton: some View {
        Button(action: {
            self.bank.searchText = ""
        }) {
            Image(systemName: "xmark.circle.fill").opacity(bank.searchText == "" ? 0 : 1)
        }
    }
    
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            searchTextField
            
            cleanTextButton
        }
        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
    }
    
    var cancelSearchButton: some View {
        Button("Cancel") {
            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
            self.bank.searchText = ""
            self.bank.isSearching = false
            zoomInstituicao = false

        }
        .foregroundColor(Color(.systemBlue))
    }

    var body: some View {
        // Search view
        HStack {
            searchBar
            
            if bank.isSearching  {
                cancelSearchButton
            }
        }
        .padding(.horizontal)
    }
    
}

struct SearchBarMap_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarMap(bank: BancoInstituicoes())
    }
}
