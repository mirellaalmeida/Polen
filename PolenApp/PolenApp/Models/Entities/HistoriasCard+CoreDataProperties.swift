//
//  HistoriasCard+CoreDataProperties.swift
//  
//
//  Created by Jéssica Amaral on 24/11/20.
//
//

import Foundation
import CoreData


extension HistoriasCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HistoriasCard> {
        return NSFetchRequest<HistoriasCard>(entityName: "HistoriasCard")
    }

    @NSManaged public var descricao: String?
    @NSManaged public var imagem: String?
    @NSManaged public var titulo: String?
    @NSManaged public var daInstituicao: Instituicao?

}
