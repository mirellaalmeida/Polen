//
//  HistoriasCard+CoreDataClass.swift
//  
//
//  Created by Jéssica Amaral on 24/11/20.
//
//

import Foundation
import CoreData

@objc(HistoriasCard)
public class HistoriasCard: NSManagedObject {
    public var wrappedTitulo: String {
        titulo ?? " "
    }
    
    public var wrappedDescricao: String {
        descricao ?? " "
    }
    
    public var wrappedImagem: String {
        imagem ?? " "
    }
}
