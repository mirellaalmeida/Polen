//
//  HistoriasCard+CoreDataClass.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 05/12/20.
//
//

import Foundation
import CoreData

@objc(HistoriasCard)
public class HistoriasCard: NSManagedObject {
    public var wrappedDescricao: String {
        descricao ?? " "
    }
    public var wrappedImagem: String {
        imagem ?? " "
    }
    public var wrappedTitulo: String {
        titulo ?? " "
    }
}
