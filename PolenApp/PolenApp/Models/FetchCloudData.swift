//
//  FetchCloudData.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 03/12/20.
//

import Foundation
import CloudKit

class CKInstituicao {
    static let database = CKContainer.default().publicCloudDatabase
    
    class func fetch(completion: @escaping (Result<[String], Error>) -> Void) {
        print("here")
        let predicate = NSPredicate(value: true)
        let descriptor = NSSortDescriptor(key: "CD_nome", ascending: true)
        let query = CKQuery(recordType: "CD_Instituicao", predicate: predicate)
        query.sortDescriptors = [descriptor]

        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["CD_nome"]
        //operation.resultsLimit = 50
        
        var instituicoes = [String]()
        
        operation.recordFetchedBlock = { record in
            let nome = (record["CD_nome"] as String?)!
            
            //let instituicao = Instituicao()
            print((record["CD_nome"] as String?)!)
            //instituicao.nome = nome
            
            instituicoes.append(nome)
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
}

