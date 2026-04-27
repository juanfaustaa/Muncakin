//
//  Gunung.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 19/04/26.
//

import Foundation
import SwiftData
//import SwiftUI

@Model
final class Mountain {
    @Attribute(.unique) var id: UUID
    var name: String
    var grade: MountainGrades
    var location: String
    var height: Int
    var minimumHikeDuration: Int
    var imageName: String
    
    @Relationship(deleteRule: .cascade, inverse: \Trip.mountain)
    var trips: [Trip] = []
    
    var specificItems: [PackItem] = []
    
    init(
        id: UUID = UUID(),
        name: String,
        grade: MountainGrades,
        location: String,
        height: Int,
        minimumHikeDuration: Int,
        imageName: String,
    ){
        self.id = id
        self.name = name
        self.grade = grade
        self.location = location
        self.height = height
        self.minimumHikeDuration = minimumHikeDuration
        self.imageName = imageName
    }
}

//let gunungDummy = [
//    Gunung(name: "Gunung Bromo", grade: "Grade I"),
//    Gunung(name: "Gunung Ambang", grade: "Grade II"),
//    Gunung(name: "Gunung Ijen", grade: "Grade II"),
//    Gunung(name: "Gunung Salak", grade: "Grade III"),
//    Gunung(name: "Gunung Gede", grade: "Grade III"),
//    Gunung(name: "Gunung Rinjani", grade: "Grade IV"),
//    Gunung(name: "Gunung Argopuro", grade: "Grade IV"),
//    Gunung(name: "Gunung Leuser", grade: "Grade V")
//]

//extension Gunung {
//    var gradeColor: AnyShapeStyle {
//        switch grade {
//        case "Grade I":
//            return AnyShapeStyle(LinearGradient(colors: [.green, .mint], startPoint: .leading, endPoint: .trailing))
//        case "Grade II":
//            return AnyShapeStyle(LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing))
//        case "Grade III":
//            return AnyShapeStyle(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
//        case "Grade IV":
//            return AnyShapeStyle(LinearGradient(colors: [.orange, .red], startPoint: .leading, endPoint: .trailing))
//        case "Grade V":
//            return AnyShapeStyle(LinearGradient(colors: [.red, .pink], startPoint: .leading, endPoint: .trailing))
//        default:
//            return AnyShapeStyle(Color.gray)
//        }
//    }
//}

