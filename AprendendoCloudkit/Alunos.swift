//
//  Alunos.swift
//  AprendendoCloudkit
//
//  Created by Alley Pereira on 22/10/20.
//

import Foundation
import CloudKit

class Alunos {
    static let recordType = "Alunos"
    private let id: CKRecord.ID
    let name: String
    let roll: Int
    
    init?(record: CKRecord) {
        guard let name = record["Name"] as? String, let roll = record["Roll"] as? Int else {return nil}
        id = record.recordID
        self.name = name
        self.roll = roll
    }
}
