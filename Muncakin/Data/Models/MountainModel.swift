//
//  Gunung.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 19/04/26.
//

import Foundation
import SwiftData

@Model
final class MountainModel {
    @Attribute(.unique) var id: UUID
    var name: String
    var grade: MountainGrades
    var location: String
    var height: Int
    var minimumHikeDuration: Int
    var imageName: String
    var specificItems: [PackItemModel] = []
    
    init(id: UUID = UUID(), name: String, grade: MountainGrades, location: String, height: Int, minimumHikeDuration: Int, imageName: String) {
        self.id = id
        self.name = name
        self.grade = grade
        self.location = location
        self.height = height
        self.minimumHikeDuration = minimumHikeDuration
        self.imageName = imageName
    }
}
