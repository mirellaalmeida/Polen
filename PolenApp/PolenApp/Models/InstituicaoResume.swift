//
//  instituicaoResume.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 09/12/20.
//

import Foundation
import CloudKit
import UIKit

struct InstituicaoResume: Identifiable, Equatable {
    var id: CKRecord.ID
    var name: String
    var description: String
    var address: String
    var image: UIImage?
}
