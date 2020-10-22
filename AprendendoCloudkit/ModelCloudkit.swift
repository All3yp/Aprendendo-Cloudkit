//
//  ModelCloudkit.swift
//  AprendendoCloudkit
//
//  Created by Alley Pereira on 22/10/20.
//

import Foundation
import CloudKit

class modelCloudkit {
    let container: CKContainer
    let databasePublic: CKDatabase
    
    static var currentModel = modelCloudkit()
    
    init() {
        container = CKContainer(identifier: "iCloud.AprendendoCloudkit")
        databasePublic = container.publicCloudDatabase
    }
    func fetchAlunos (_ completion: @escaping (Result<[Alunos], Error>) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Alunos", predicate: predicate)
        databasePublic.perform(query, inZoneWith: CKRecordZone.default().zoneID) { results, errors in
            if let error = errors {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            guard let result = results else { return }
            let alunos = result.compactMap {
                Alunos.init(record: $0)
            }
            DispatchQueue.main.async {
                completion(.success(alunos))
            }
        }
    }
}
