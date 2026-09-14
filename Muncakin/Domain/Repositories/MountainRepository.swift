//
//  MountainRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation

protocol MountainRepository {
    func fetchAllMountains() throws -> [Mountain]
    func fetchMountain(mountain: Mountain) throws -> Mountain?
}
