//
//  ColaboreCard+CoreDataProperties.swift
//  
//
//  Created by Jéssica Amaral on 24/11/20.
//
//

import Foundation
import CoreData


extension ColaboreCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ColaboreCard> {
        return NSFetchRequest<ColaboreCard>(entityName: "ColaboreCard")
    }

    @NSManaged public var descricao: String?
    @NSManaged public var titulo: String?
    @NSManaged public var relationship: Instituicao?

}
