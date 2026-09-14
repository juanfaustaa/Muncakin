//
//  MountainSeed.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation
import SwiftData

struct MountainSeed {
    static let mountainSeed: [MountainModel] = [
        // Grade I
        .init(name: "Gunung Bromo", grade: .gradeI, location: "Jawa Timur", height: 2329, minimumHikeDuration: 2, imageName: "gunung_bromo"),
        
        // Grade II
        .init(name: "Gunung Ambang", grade: .gradeII, location: "Sulawesi Utara", height: 1795, minimumHikeDuration: 2, imageName: "gunung_ambang"),
        
        .init(name: "Gunung Ijen", grade: .gradeII, location: "Jawa Timur", height: 2769, minimumHikeDuration: 2, imageName: "gunung_ijen"),
        
        .init(name: "Gunung Kaba", grade: .gradeII, location: "Bengkulu", height: 1952, minimumHikeDuration: 2, imageName: "gunung_kaba"),
        
        .init(name: "Gunung Bulu Baria", grade: .gradeII, location: "Bengkulu", height: 2730, minimumHikeDuration: 2, imageName: "gunung_bulubaria"),
        
        .init(name: "Gunung Mambulilling", grade: .gradeII, location: "Bengkulu", height: 2873, minimumHikeDuration: 2, imageName: "gunung_mambulilling"),
        
        .init(name: "Gunung Papandayan", grade: .gradeII, location: "Jawa Barat", height: 2665, minimumHikeDuration: 2, imageName: "gunung_papandayan"),
        
        .init(name: "Gunung Bulusaraung", grade: .gradeII, location: "Sulawesi Selatan", height: 1353, minimumHikeDuration: 2, imageName: "gunung_bulusaraung"),
        
        .init(name: "Gunung Batur", grade: .gradeII, location: "Bali", height: 1717, minimumHikeDuration: 2, imageName: "gunung_batur"),
        
        .init(name: "Gunung Maras", grade: .gradeII, location: "Bangka Belitung", height: 669, minimumHikeDuration: 2, imageName: "gunung_maras"),
        
        // Grade III
        .init(name: "Gunung Kelimutu", grade: .gradeIII, location: "NTT", height: 1639, minimumHikeDuration: 2, imageName: "gunung_kelimutu"),
        
        .init(name: "Gunung Ciremai", grade: .gradeIII, location: "Jawa Barat", height: 3078, minimumHikeDuration: 2, imageName: "gunung_ciremai"),
        
        .init(name: "Gunung Bawakaraeng", grade: .gradeIII, location: "Sulawesi Selatan", height: 2830, minimumHikeDuration: 2, imageName: "gunung_bawakaraeng"),
        
        .init(name: "Gunung Pangrango", grade: .gradeIII, location: "Jawa Barat", height: 3026, minimumHikeDuration: 2, imageName: "gunung_pangrango"),
        
        .init(name: "Gunung Gede", grade: .gradeIII, location: "Jawa Barat", height: 2958, minimumHikeDuration: 2, imageName: "gunung_gede"),
        
        .init(name: "Gunung Halimun Salak", grade: .gradeIII, location: "Jawa Barat", height: 1929, minimumHikeDuration: 2, imageName: "gunung_halimunsalak"),
        
        .init(name: "Gunung Merbabu", grade: .gradeIII, location: "Jawa Tengah", height: 3145, minimumHikeDuration: 2, imageName: "gunung_merbabu"),
        
        .init(name: "Gunung Nokilalaki", grade: .gradeIII, location: "Sulawesi Tengah", height: 2357, minimumHikeDuration: 2, imageName: "gunung_nokilalaki"),
        
        .init(name: "Gunung Masurai", grade: .gradeIII, location: "Jambi", height: 2916, minimumHikeDuration: 3, imageName: "gunung_masurai"),
        
        .init(name: "Danau Gunung Tujuh", grade: .gradeIII, location: "Jambi", height: 2732, minimumHikeDuration: 2, imageName: "danau_gunung_tujuh_kerinci"),
        
        .init(name: "Gunung Kelam", grade: .gradeIII, location: "Kalimantan Barat", height: 1002, minimumHikeDuration: 2, imageName: "gunung_kelam"),
        
        // Grade IV
        .init(name: "Gunung Kerinci", grade: .gradeIV, location: "Jambi", height: 3805, minimumHikeDuration: 2, imageName: "gunung_kerinci"),
        
        .init(name: "Gunung Argopuro", grade: .gradeIV, location: "Jawa Timur", height: 3088, minimumHikeDuration: 4, imageName: "gunung_argopuro"),
        
        .init(name: "Gunung Bukit Raya", grade: .gradeIV, location: "KalBar & KalTeng", height: 2278, minimumHikeDuration: 2, imageName: "gunung_bukit_raya"),
        
        .init(name: "Gunung Gandang Dewata", grade: .gradeIV, location: "Sulawesi Barat", height: 3037, minimumHikeDuration: 7, imageName: "gunung_gandang_dewata"),
        
        .init(name: "Gunung Binaiya", grade: .gradeIV, location: "Maluku", height: 3027, minimumHikeDuration: 11, imageName: "gunung_binaiya"),
        
        .init(name: "Gunung Rinjani", grade: .gradeIV, location: "NTB", height: 3726, minimumHikeDuration: 3, imageName: "gunung_rinjani"),
        
        // Grade V
        .init(name: "Gunung Leuser", grade: .gradeV, location: "Aceh", height: 3466, minimumHikeDuration: 10, imageName: "gunung_leuser"),
        
        .init(name: "Carstensz Pyramid", grade: .gradeV, location: "Papua", height: 4884, minimumHikeDuration: 10, imageName: "gunung_carstensz_pyramid"),
        
        .init(name: "Gunung Trikora", grade: .gradeV, location: "Papua", height: 4751, minimumHikeDuration: 7, imageName: "gunung_trikora")
    ]
    
    static func mountainName(_ name: String) -> MountainModel {
        guard let mountain = mountainSeed.first(where: { $0.name == name}) else {
            fatalError("Mountain \(name) not found")
        }
        return mountain
    }
}
