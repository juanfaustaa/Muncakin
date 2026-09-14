//
//  MockMountainRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 03/09/26.
//

import Foundation
import SwiftData

final class MockMountainRepository: MountainRepository {
    func fetchAllMountains() throws -> [Mountain] {
        [
            Mountain(
                id: UUID(),
                name: "Gunung Rinjani",
                grade: .gradeIV,
                location: "Nusa Tenggara Barat",
                height: 3726,
                minimumHikeDuration: 3,
                imageName: "gunung_rinjani",
                specificItems: []
            ),

            Mountain(
                id: UUID(),
                name: "Gunung Bromo",
                grade: .gradeI,
                location: "Jawa Timur",
                height: 2329,
                minimumHikeDuration: 2,
                imageName: "gunung_bromo",
                specificItems: []
            )
        ]

    }
    
    func fetchMountain(mountain: Mountain) throws -> Mountain? {
        return mountain
    }
}
