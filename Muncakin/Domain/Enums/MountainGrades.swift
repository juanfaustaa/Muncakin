//
//  MountainGrades.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

enum MountainGrades: String, Codable, CaseIterable, Hashable {
    case gradeI = "Grade I"
    case gradeII = "Grade II"
    case gradeIII = "Grade III"
    case gradeIV = "Grade IV"
    case gradeV = "Grade V"
    
    var label: String {
        switch self {
        case.gradeI: return "Grade I"
        case.gradeII: return "Grade II"
        case.gradeIII: return "Grade III"
        case.gradeIV: return "Grade IV"
        case.gradeV: return "Grade V"
        }
    }
}
