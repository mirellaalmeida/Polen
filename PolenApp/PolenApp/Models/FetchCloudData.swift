//
//  FetchCloudData.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 03/12/20.
//

import Foundation
import CloudKit
import UIKit

class CKInstituicao {
    static let database = CKContainer.default().privateCloudDatabase
    static let publicDatabase = CKContainer.default().publicCloudDatabase
    
    class func fetch(completion: @escaping (Result<[String], Error>) -> Void) {
        let predicate = NSPredicate(value: true)
        let descriptor = NSSortDescriptor(key: "CD_nome", ascending: true)
        let query = CKQuery(recordType: "CD_Instituicao", predicate: predicate)
        query.sortDescriptors = [descriptor]

        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["CD_id", "CD_nome"]
        //operation.resultsLimit = 50
        
        var instituicoes = [String]()
        
        operation.recordFetchedBlock = { record in
            let id = (record["CD_id"] as String?)!
            if record["CD_nome"] != nil {
                instituicoes.append(id)
            } else {
                record["CD_id"] = " "
            }
            //let instituicao = Instituicao()
            //print((record["CD_id"] as String?)!)
            //instituicao.nome = nome
            
            //instituicoes.append(id)
        }
        
        operation.queryCompletionBlock = { (_, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(instituicoes))
                }
            }
        }
        database.add(operation)
    }
    
//    struct instituicaoResume {
//        var id: CKRecord.ID
//        var name: String
//        var description: String
//        var address: String
//    }
    
    class func fetchAddresses (completion: @escaping (Result<[InstituicaoResume], Error>) -> Void) {
        let predicate = NSPredicate(value: true)
        let descriptor = NSSortDescriptor(key: "CD_nome", ascending: true)
        let query = CKQuery(recordType: "CD_Instituicao", predicate: predicate)
        query.sortDescriptors = [descriptor]
        
        var instituicoes = [InstituicaoResume]()
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            
            var instituicao: InstituicaoResume = .init(
                id: (record.recordID),
                name: (record["CD_nome"] as String?) ?? " ",
                description: (record["CD_descricao"] as String?) ?? " ",
                address: (record["CD_cidade"] as String?) ?? " ",
                favoritada: false
            )
            let asset = record["CD_imagem_ckAsset"] as? CKAsset
            
            if asset != nil {
                let cardImage = NSData(contentsOf: (asset?.fileURL)!)
                instituicao.image = UIImage(data: cardImage! as Data)
            }
            instituicoes.append(instituicao)
        }
        
        operation.queryCompletionBlock = { (_, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(instituicoes))
                }
            }
        }
        publicDatabase.add(operation)
    }
    
    class func fetchHistorias (instituicaoID: CKRecord.ID, completion: @escaping (Result<[HistoriasResume], Error>) -> Void) {
        let recordSearched = CKRecord.Reference(recordID: instituicaoID, action: .deleteSelf)
        let predicate = NSPredicate(format: "daInstituicao == %@", recordSearched)
        let descriptor = NSSortDescriptor(key: "creationDate", ascending: true)
        
        let query = CKQuery(recordType: "CD_HistoriasCard", predicate: predicate)
        query.sortDescriptors = [descriptor]
        
        var historias = [HistoriasResume]()
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            
            var historia: HistoriasResume = .init(
                id: record.recordID.recordName, 
                name: (record["CD_titulo"] as String?)!,
                description: (record["CD_descricao"] as String?)!
            )
            
            let asset = record["CD_imagem_ckAsset"] as? CKAsset
            
            if asset != nil {
                let cardImage = NSData(contentsOf: (asset?.fileURL)!)
                historia.image = UIImage(data: cardImage! as Data)
            }
            
            historias.append(historia)
        }
        
        operation.queryCompletionBlock = { (_, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(historias))
                }
            }
        }
        publicDatabase.add(operation)
    }
    
    class func fetchColabore (instituicaoID: CKRecord.ID, completion: @escaping (Result<[HistoriasResume], Error>) -> Void) {
        let recordSearched = CKRecord.Reference(recordID: instituicaoID, action: .deleteSelf)
        let predicate = NSPredicate(format: "relationship == %@", recordSearched)
        let descriptor = NSSortDescriptor(key: "creationDate", ascending: true)
        
        let query = CKQuery(recordType: "CD_ColaboreCard", predicate: predicate)
        query.sortDescriptors = [descriptor]
        
        var cards = [HistoriasResume]()
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            let card: HistoriasResume = .init(
                id: record.recordID.recordName,
                name: (record["CD_titulo"] as String?)!,
                description: (record["CD_descricao"] as String?)!
            )
            
            cards.append(card)
        }
        
        operation.queryCompletionBlock = { (_, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(cards))
                }
            }
        }
        publicDatabase.add(operation)
    }
}

