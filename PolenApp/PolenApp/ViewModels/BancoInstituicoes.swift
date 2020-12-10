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
        for instituicoes in self.getInstitutions(){
            let item = instituicoes
            items!.append(item)
        }
    }
}

extension BancoInstituicoes {
    func getInstitutions() -> [Checkpoint] {
        var instituicoes: [Checkpoint] = []
        instituicoes.append(Checkpoint(title: "Recomeço Refugiados", subtitle: "Aulas de português para haitianos", coordinate: .init(latitude: -16.3624, longitude: -49.1534)))
        instituicoes.append(Checkpoint(title: "Instituto Adus", subtitle: "Integração social de refugiados e vítimas de migrações forçadas", coordinate: .init(latitude: -7.9021, longitude: -34.8296)))
        
        return instituicoes
    }
    
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
