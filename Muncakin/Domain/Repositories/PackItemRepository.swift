//
//  PackItemRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation

protocol PackItemRepository {
    func fetchGeneralItems() throws -> [PackItem]
    func fetchMountainSpesificItems(for mountain: Mountain) throws -> [PackItem]
}
