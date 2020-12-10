//
//  Instituicao+CoreDataClass.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 05/12/20.
//
//

import Foundation
import CoreData

@objc(Instituicao)
public class Instituicao: NSManagedObject {
    public var wrappedEmail: String {
        email ?? " "
    }
    public var wrappedCidade: String {
        cidade ?? " "
    }
    public var wrappedDescricao: String {
        descricao ?? " "
    }
    public var wrappedFacebook: String {
        facebook ?? " "
    }
    public var wrappedID: String {
        id ?? " "
    }
    public var wrappedImagem: String {
        imagem ?? " "
    }
    public var wrappedInstagram: String {
        instagram ?? " "
    }
    public var wrappedNome: String {
        nome ?? " "
    }
    public var wrappedSite: String {
        site ?? " "
    }
    public var wrappedTelefone: String {
        telefone ?? " "
    }
    
    public var historiasArray: [HistoriasCard] {
        let historiaSet = historiasList as?  Set<HistoriasCard> ?? []
        return  historiaSet.sorted {
            $0.wrappedTitulo < $1.wrappedTitulo
        }
    }
    
    public var colaboreArray: [ColaboreCard] {
        let colaboreSet = colaboreList as?  Set<ColaboreCard> ?? []
        return  colaboreSet.sorted {
            $0.wrappedTitulo < $1.wrappedTitulo
        }
    }
}
