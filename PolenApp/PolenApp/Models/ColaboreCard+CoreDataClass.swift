//
//  ColaboreCard+CoreDataClass.swift
//  
//
//  Created by Jéssica Amaral on 24/11/20.
//
//

import Foundation
import CoreData

@objc(ColaboreCard)
public class ColaboreCard: NSManagedObject {
    public var wrappeDescricao: String {
        descricao ?? " "
   }
    public var wrappedTitulo: String {
        titulo ?? " "
   }
}
