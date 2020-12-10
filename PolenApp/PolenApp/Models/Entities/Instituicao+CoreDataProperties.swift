//
//  Instituicao+CoreDataProperties.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 05/12/20.
//
//

import Foundation
import CoreData


extension Instituicao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instituicao> {
        return NSFetchRequest<Instituicao>(entityName: "Instituicao")
    }
    
    @NSManaged public var email: String?
    @NSManaged public var cidade: String?
    @NSManaged public var descricao: String?
    @NSManaged public var facebook: String?
    @NSManaged public var id: String?
    @NSManaged public var imagem: String?
    @NSManaged public var instagram: String?
    @NSManaged public var nome: String?
    @NSManaged public var site: String?
    @NSManaged public var telefone: String?
    @NSManaged public var colaboreList: NSSet?
    @NSManaged public var favoritos: NSSet?
    @NSManaged public var historiasList: NSSet?

}

// MARK: Generated accessors for colaboreList
extension Instituicao {

    @objc(addColaboreListObject:)
    @NSManaged public func addToColaboreList(_ value: ColaboreCard)

    @objc(removeColaboreListObject:)
    @NSManaged public func removeFromColaboreList(_ value: ColaboreCard)

    @objc(addColaboreList:)
    @NSManaged public func addToColaboreList(_ values: NSSet)

    @objc(removeColaboreList:)
    @NSManaged public func removeFromColaboreList(_ values: NSSet)

}

// MARK: Generated accessors for favoritos
extension Instituicao {

    @objc(addFavoritosObject:)
    @NSManaged public func addToFavoritos(_ value: Instituicao)

    @objc(removeFavoritosObject:)
    @NSManaged public func removeFromFavoritos(_ value: Instituicao)

    @objc(addFavoritos:)
    @NSManaged public func addToFavoritos(_ values: NSSet)

    @objc(removeFavoritos:)
    @NSManaged public func removeFromFavoritos(_ values: NSSet)

}

// MARK: Generated accessors for historiasList
extension Instituicao {

    @objc(addHistoriasListObject:)
    @NSManaged public func addToHistoriasList(_ value: HistoriasCard)

    @objc(removeHistoriasListObject:)
    @NSManaged public func removeFromHistoriasList(_ value: HistoriasCard)

    @objc(addHistoriasList:)
    @NSManaged public func addToHistoriasList(_ values: NSSet)

    @objc(removeHistoriasList:)
    @NSManaged public func removeFromHistoriasList(_ values: NSSet)

}

extension Instituicao : Identifiable {

}

extension Instituicao {
    static func getInstituicoesFetchRequest() -> NSFetchRequest<Instituicao> {
        let request: NSFetchRequest<Instituicao> = Instituicao.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
        
        return request
    }
}

