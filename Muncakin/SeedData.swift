//
//  Seed.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import Foundation
import SwiftData

struct SeedData {
    static func seed(context: ModelContext) {
        // Seeding Data Gunung
        // Grade I
        let bromo = Mountain(name: "Gunung Bromo", grade: .gradeI, location: "Jawa Timur", height: 2329, minimumHikeDuration: 2, imageName: "gunung_bromo")
        
        // Grade II
        let ambang = Mountain(name: "Gunung Ambang", grade: .gradeII, location: "Sulawesi Utara", height: 1795, minimumHikeDuration: 2, imageName: "gunung_ambang")
        
        let ijen = Mountain(name: "Gunung Ijen", grade: .gradeII, location: "Jawa Timur", height: 2769, minimumHikeDuration: 2, imageName: "gunung_ijen")
        
        let kaba = Mountain(name: "Gunung Kaba", grade: .gradeII, location: "Bengkulu", height: 1952, minimumHikeDuration: 2, imageName: "gunung_kaba")
        
        let bulubaria = Mountain(name: "Gunung Bulu Baria", grade: .gradeII, location: "Bengkulu", height: 2730, minimumHikeDuration: 2, imageName: "gunung_bulubaria")
        
        let mambulilling = Mountain(name: "Gunung Mambulilling", grade: .gradeII, location: "Bengkulu", height: 2873, minimumHikeDuration: 2, imageName: "gunung_mambulilling")
        
        let papandayan = Mountain(name: "Gunung Papandayan", grade: .gradeII, location: "Jawa Barat", height: 2665, minimumHikeDuration: 2, imageName: "gunung_papandayan")
        
        let bulusaraung = Mountain(name: "Gunung Bulusaraung", grade: .gradeII, location: "Sulawesi Selatan", height: 1353, minimumHikeDuration: 2, imageName: "gunung_bulusaraung")
        
        let batur = Mountain(name: "Gunung Batur", grade: .gradeII, location: "Bali", height: 1717, minimumHikeDuration: 2, imageName: "gunung_batur")
        
        let maras = Mountain(name: "Gunung Maras", grade: .gradeII, location: "Bangka Belitung", height: 669, minimumHikeDuration: 2, imageName: "gunung_maras")
        
        // Grade III
        let kelimutu = Mountain(name: "Gunung Kelimutu", grade: .gradeIII, location: "NTT", height: 1639, minimumHikeDuration: 2, imageName: "gunung_kelimutu")
        
        let ciremai = Mountain(name: "Gunung Ciremai", grade: .gradeIII, location: "Jawa Barat", height: 3078, minimumHikeDuration: 2, imageName: "gunung_ciremai")
        
        let bawakaraeng = Mountain(name: "Gunung Bawakaraeng", grade: .gradeIII, location: "Sulawesi Selatan", height: 2830, minimumHikeDuration: 2, imageName: "gunung_bawakaraeng")
        
        let pangrango = Mountain(name: "Gunung Pangrango", grade: .gradeIII, location: "Jawa Barat", height: 3026, minimumHikeDuration: 2, imageName: "gunung_pangrango")
        
        let gede = Mountain(name: "Gunung Gede", grade: .gradeIII, location: "Jawa Barat", height: 2958, minimumHikeDuration: 2, imageName: "gunung_gede")
        
        let halimun_salak = Mountain(name: "Gunung Halimun Salak", grade: .gradeIII, location: "Jawa Barat", height: 1929, minimumHikeDuration: 2, imageName: "gunung_halimunsalak")
        
        let merbabu = Mountain(name: "Gunung Merbabu", grade: .gradeIII, location: "Jawa Tengah", height: 3145, minimumHikeDuration: 2, imageName: "gunung_merbabu")
        
        let nokilalaki = Mountain(name: "Gunung Nokilalaki", grade: .gradeIII, location: "Sulawesi Tengah", height: 2357, minimumHikeDuration: 2, imageName: "gunung_nokilalaki")
        
        let masurai = Mountain(name: "Gunung Masurai", grade: .gradeIII, location: "Jambi", height: 2916, minimumHikeDuration: 3, imageName: "gunung_masurai")
        
        let tujuh = Mountain(name: "Danau Gunung Tujuh", grade: .gradeIII, location: "Jambi", height: 2732, minimumHikeDuration: 2, imageName: "danau_gunung_tujuh_kerinci")
        
        let kelam = Mountain(name: "Gunung Kelam", grade: .gradeIII, location: "Kalimantan Barat", height: 1002, minimumHikeDuration: 2, imageName: "gunung_kelam")
        
        // Grade IV
        let kerinci = Mountain(name: "Gunung Kerinci", grade: .gradeIV, location: "Jambi", height: 3805, minimumHikeDuration: 2, imageName: "gunung_kerinci")
        
        let argopuro = Mountain(name: "Gunung Argopuro", grade: .gradeIV, location: "Jawa Timur", height: 3088, minimumHikeDuration: 4, imageName: "gunung_argopuro")
        
        let bukit_raya = Mountain(name: "Gunung Bukit Raya", grade: .gradeIV, location: "KalBar & KalTeng", height: 2278, minimumHikeDuration: 2, imageName: "gunung_bukit_raya")
        
        let gandang_dewata = Mountain(name: "Gunung Gandang Dewata", grade: .gradeIV, location: "Sulawesi Barat", height: 3037, minimumHikeDuration: 7, imageName: "gunung_gandang_dewata")
        
        let binaiya = Mountain(name: "Gunung Binaiya", grade: .gradeIV, location: "Maluku", height: 3027, minimumHikeDuration: 11, imageName: "gunung_binaiya")
        
        let rinjani = Mountain(name: "Gunung Rinjani", grade: .gradeIV, location: "NTB", height: 3726, minimumHikeDuration: 3, imageName: "gunung_rinjani")
        
        // Grade V
        let leuser = Mountain(name: "Gunung Leuser", grade: .gradeV, location: "Aceh", height: 3466, minimumHikeDuration: 10, imageName: "gunung_leuser")
        
        let carstensz = Mountain(name: "Carstensz Pyramid", grade: .gradeV, location: "Papua", height: 4884, minimumHikeDuration: 10, imageName: "gunung_carstensz_pyramid")
        
        let trikora = Mountain(name: "Gunung Trikora", grade: .gradeV, location: "Papua", height: 4751, minimumHikeDuration: 7, imageName: "gunung_trikora")
        
        // insert gunung-gunung
        [bromo, ambang, ijen, kaba, bulubaria, mambulilling, kelimutu, papandayan, bulusaraung, batur, maras, ciremai, bawakaraeng, pangrango, gede, halimun_salak, merbabu, nokilalaki, masurai, tujuh, kerinci, kelam, argopuro, bukit_raya, gandang_dewata, binaiya, rinjani, leuser, carstensz, trikora].forEach {
            context.insert($0)
        }
        
        // Seeding Data Barang Essensial dan Essensial tapi Opsional di setiap trip
        
        let essentials: [PackItem] = [
        // Shelter
            .init(name: "Sleeping Bag", defaultQuantity: 1, units: .pcs, layer: .essential, category: .shelter),
            .init(name: "Matras", defaultQuantity: 1, units: .pcs, layer: .essential, category: .shelter),
            .init(name: "Pasak Tenda", defaultQuantity: 1, units: .set, layer: .essential, category: .shelter),
            .init(name: "Rangka Tenda", defaultQuantity: 1, units: .set, layer: .essential, category: .shelter),
            .init(name: "Tali Tenda", defaultQuantity: 1, units: .set, layer: .essential, category: .shelter),
            .init(name: "Flysheet", defaultQuantity: 1, units: .pcs, layer: .essential, category: .shelter),
            .init(name: "Hammock", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .shelter),
        
        // Barang Pribadi (personalThings)
            .init(name: "Pakaian Layering", defaultQuantity: 1, units: .set, layer: .essential, category: .personalThings),
            .init(name: "Celana Gunung", defaultQuantity: 1, units: .pcs, layer: .essential, category: .personalThings),
            .init(name: "Jaket Gunung", defaultQuantity: 1, units: .pcs, layer: .essential, category: .personalThings),
            .init(name: "Sepatu Gunung", defaultQuantity: 1, units: .pair, layer: .essential, category: .personalThings),
            .init(name: "Sarung Tangan", defaultQuantity: 1, units: .pair, layer: .essential, category: .personalThings),
            .init(name: "Kaos Kaki", defaultQuantity: 2, units: .pair, layer: .essential, category: .personalThings),
            .init(name: "Jas Ujan", defaultQuantity: 1, units: .pcs, layer: .essential, category: .personalThings),
            .init(name: "Baju Ganti", defaultQuantity: 1, units: .pcs, layer: .essential, category: .personalThings),
            .init(name: "Celana Ganti", defaultQuantity: 1, units: .pcs, layer: .essential, category: .personalThings),
            .init(name: "Pakaian Dalam Cadangan", defaultQuantity: 1, units: .pcs, layer: .essential, category: .personalThings),
            .init(name: "Topi", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .personalThings),
            .init(name: "Kacamata", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .personalThings),
            .init(name: "Sandal", defaultQuantity: 1, units: .pair, layer: .essentialOptional, category: .personalThings),
            .init(name: "Peralatan Mandi", defaultQuantity: 1, units: .set, layer: .essentialOptional, category: .personalThings),
            .init(name: "Sunscreen", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .personalThings),
            
        // Logistik dan Makanan (foodAndLogistics)
            .init(name: "Nesting", defaultQuantity: 1, units: .set, layer: .essential, category: .foodAndLogistics),
            .init(name: "Gas Kaleng", defaultQuantity: 1, units: .pcs, layer: .essential, category: .foodAndLogistics),
            .init(name: "Korek Api", defaultQuantity: 1, units: .pack, layer: .essential, category: .foodAndLogistics),
            .init(name: "Botol Air", defaultQuantity: 1, units: .pcs, layer: .essential, category: .foodAndLogistics),
            .init(name: "Alat Makan", defaultQuantity: 1, units: .set, layer: .essential, category: .foodAndLogistics),
            .init(name: "Filter Air Portable", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .foodAndLogistics),
        
        // Safety Tools (safetyTools)
            .init(name: "Headlamp / Senter", defaultQuantity: 1, units: .pcs, layer: .essential, category: .safetyTools),
            .init(name: "Pisau Lipat", defaultQuantity: 1, units: .pcs, layer: .essential, category: .safetyTools),
            .init(name: "Kompas", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .safetyTools),
            .init(name: "Tali Prusik", defaultQuantity: 1, units: .gulung, layer: .essentialOptional, category: .safetyTools),
        
        // P3K (p3k)
            .init(name: "Betadine", defaultQuantity: 1, units: .pcs, layer: .essential, category: .firstAid),
            .init(name: "Pembersih Alkohol", defaultQuantity: 1, units: .pcs, layer: .essential, category: .firstAid),
            .init(name: "Pinset", defaultQuantity: 1, units: .pcs, layer: .essential, category: .firstAid),
            .init(name: "Salep Antiseptik", defaultQuantity: 1, units: .pcs, layer: .essential, category: .firstAid),
            .init(name: "Perban", defaultQuantity: 1, units: .gulung, layer: .essential, category: .firstAid),
            .init(name: "Sarung Tangan Lateks", defaultQuantity: 1, units: .pair, layer: .essentialOptional, category: .firstAid),
            .init(name: "Bubuk Elektrolit", defaultQuantity: 1, units: .pack, layer: .essential, category: .firstAid),
            .init(name: "Kapas", defaultQuantity: 1, units: .pack, layer: .essential, category: .firstAid),
            .init(name: "Plester", defaultQuantity: 1, units: .pack, layer: .essential, category: .firstAid),
            .init(name: "Obat Pribadi", defaultQuantity: 1, units: .set, layer: .essential, category: .firstAid),
        
        // Dokumen
            .init(name: "KTP", defaultQuantity: 1, units: .pcs, layer: .essential, category: .document),
            .init(name: "Materai", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .document),
            .init(name: "Surat Pendakian", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .document),
        
        
        // Lainnya
            .init(name: "Lakban", defaultQuantity: 1, units: .pcs, layer: .essentialOptional, category: .others),
            .init(name: "Trashbag", defaultQuantity: 1, units: .pcs, layer: .essential, category: .others),
            .init(name: "Powerbank", defaultQuantity: 1, units: .pcs, layer: .essential, category: .others),
            .init(name: "Rain Cover", defaultQuantity: 1, units: .pcs, layer: .essential, category: .others),
            .init(name: "Baterai Cadangan", defaultQuantity: 1, units: .pack, layer: .essential, category: .others)
        
        ]
        // Seeding Data Barang Esensial di Spesifik gunung
        let mountainItems: [PackItem] = [
            .init(name: "Masker Buff", defaultQuantity: 1, units: .pcs, layer: .mountainEssential, category: .safetyTools, mountains: [bromo, ambang, kelimutu, papandayan, batur, kerinci, rinjani]),
            .init(name: "Gaiter", defaultQuantity: 1, units: .pair, layer: .mountainEssential, category: .safetyTools, mountains: [batur, kerinci, leuser]),
            .init(name: "Trekking Pole", defaultQuantity: 1, units: .pair, layer: .mountainEssential, category: .safetyTools, mountains: [mambulilling, ciremai, bawakaraeng, pangrango, gede, nokilalaki, kerinci, gandang_dewata]),
            .init(name: "Masker Respirator", defaultQuantity: 1, units: .pcs, layer: .mountainEssential, category: .safetyTools, mountains: [ijen]),
            .init(name: "Peralatan Panjat", defaultQuantity: 1, units: .set, layer: .mountainEssential, category: .safetyTools, mountains: [carstensz, trikora])
        ]
        
        (essentials + mountainItems).forEach {
            context.insert($0)
        }
        
    }
}
