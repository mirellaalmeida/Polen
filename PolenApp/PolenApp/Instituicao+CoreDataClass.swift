//
//  Instituicao+CoreDataClass.swift
//  
//
//  Created by Jéssica Amaral on 24/11/20.
//
//

import Foundation
import CoreData

@objc(Instituicao)
public class Instituicao: NSManagedObject {
    public var wrappedNome: String {
        nome ?? " "
    }
    public var wrappedDescricao: String {
        descricao ?? " "
    }
    public var wrappedCidade: String {
        cidade ?? " "
    }
    public var wrappedFacebook: String {
        facebook ?? " "
    }
    public var wrappedImagem: String {
        imagem ?? " "
    }
    public var wrappedInstagram: String {
        instagram ?? " "
    }
    public var wrappedSite: String {
        site ?? " "
    }
    public var wrappedTelefone: String {
        telefone ?? " "
    }
    public var historiasArray: [HistoriasCard] {
        let set = historiasList as? Set<HistoriasCard> ?? []
        return set.sorted {
            $0.wrappedTitulo < $1.wrappedTitulo
        }
    }
    
    public var colaboreArray: [ColaboreCard] {
        let set = colaboreList as? Set<ColaboreCard> ?? []
        return set.sorted {
            $0.wrappedTitulo < $1.wrappedTitulo
        }
    }
}
