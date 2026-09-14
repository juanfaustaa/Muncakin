//
//  Mountain.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct Mountain: Identifiable {
    let id: UUID
    let name: String
    let grade: MountainGrades
    let location: String
    let height: Int
    let minimumHikeDuration: Int
    let imageName: String
    let specificItems: [PackItem]
}
