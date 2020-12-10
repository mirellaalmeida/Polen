//
//  ColaboreCard+CoreDataClass.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 05/12/20.
//
//

import Foundation
import CoreData

@objc(ColaboreCard)
public class ColaboreCard: NSManagedObject {
    public var wrappedTitulo: String {
        titulo ?? " "
    }
    
    public var wrappedDescricao: String {
        descricao ?? "  "
    }
}
