//
//  BancoInstituicoes.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import Foundation
import SwiftUI


public class BancoInstituicoes: ObservableObject, Identifiable{
    
    @Published var items: [Checkpoint]?
    
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    
    init() {
        self.clear()
        self.addItems()
        
    }
    func clear(){
        items = []
    }
    
    /// This function adds all items in the array 'items'
    func addItems(){
        for instituicoes in self.getInstitutions(){
            let item = instituicoes
            items!.append(item)
            
            
        }
    }
    
}

extension BancoInstituicoes{
    func getInstitutions() -> [Checkpoint]{
        var instituicoes: [Checkpoint] = []
        instituicoes.append(Checkpoint(title: "Recomeço Refugiados", subtitle: "Aulas de português para haitianos", coordinate: .init(latitude: -16.3558, longitude: -49.1649)))
        instituicoes.append(Checkpoint(title: "Adus", subtitle: "Integração social de refugiados e vítimas de migrações forçadas", coordinate: .init(latitude: -7.9021, longitude: -34.8296)))
        
        return instituicoes
    }
}
