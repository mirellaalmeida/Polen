//
//  BancoInstituicoes.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import Foundation
import SwiftUI
import CloudKit

public class BancoInstituicoes: ObservableObject, Identifiable {
    
    @Published var items: [Checkpoint]?
    
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    
    init() {
        self.clear()
        self.addItems()
    }
    
    func clear() {
        items = []
    }
    
    /// This function adds all items in the array 'items'
    func addItems() {
        CKInstituicao.fetchAddresses { results in
            switch results {
            case .success(let newInstituicoes):
                //2 - Transformar em coordenadas
                for instituicao in newInstituicoes {
                    self.getCoordinate(addressString: instituicao.address) { (coordinate, error) in
                        //3 - adicionar ao banco
                        if (error == nil) {
                            let newInstituicao: Checkpoint = .init(
                                title: instituicao.name,
                                subtitle: instituicao.description,
                                coordinate: coordinate
                            )
                            
                            self.items?.append(newInstituicao)
                            
                        } else {
                            print(error)
                        }
                    }
                }
 
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension BancoInstituicoes {
    
    private func getCoordinate(addressString: String,
                               completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void) {
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                    
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
            
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
    
}
