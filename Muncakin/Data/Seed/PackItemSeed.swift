//
//  PackItemSeed.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation
import SwiftData

struct PackItemSeed {
    static let essentials: [PackItemModel] = [
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
    static let bromo = MountainSeed.mountainName("Gunung Bromo")
    static let ambang = MountainSeed.mountainName("Gunung Ambang")
    static let kelimutu = MountainSeed.mountainName("Gunung Kelimutu")
    static let papandayan = MountainSeed.mountainName("Gunung Papandayan")
    static let batur = MountainSeed.mountainName("Gunung Batur")
    static let kerinci = MountainSeed.mountainName("Gunung Kerinci")
    static let rinjani = MountainSeed.mountainName("Gunung Rinjani")
    static let mambulilling = MountainSeed.mountainName("Gunung Mambulilling")
    static let ciremai = MountainSeed.mountainName("Gunung Ciremai")
    static let bawakaraeng = MountainSeed.mountainName("Gunung Bawakaraeng")
    static let pangrango = MountainSeed.mountainName("Gunung Pangrango")
    static let leuser = MountainSeed.mountainName("Gunung Leuser")
    static let gede = MountainSeed.mountainName("Gunung Gede")
    static let nokilalaki = MountainSeed.mountainName("Gunung Nokilalaki")
    static let gandang_dewata = MountainSeed.mountainName("Gunung Gandang Dewata")
    static let carstensz = MountainSeed.mountainName("Carstensz Pyramid")
    static let trikora = MountainSeed.mountainName("Gunung Trikora")
    static let ijen = MountainSeed.mountainName("Gunung Ijen")
    
    static let mountainEssentials: [PackItemModel] = [
        .init(name: "Masker Buff", defaultQuantity: 1, units: .pcs, layer: .mountainEssential, category: .safetyTools, mountains: [bromo, ambang, kelimutu, papandayan, batur, kerinci, rinjani]),
        .init(name: "Gaiter", defaultQuantity: 1, units: .pair, layer: .mountainEssential, category: .safetyTools, mountains: [batur, kerinci, leuser]),
        .init(name: "Trekking Pole", defaultQuantity: 1, units: .pair, layer: .mountainEssential, category: .safetyTools, mountains: [mambulilling, ciremai, bawakaraeng, pangrango, gede, nokilalaki, kerinci, gandang_dewata]),
        .init(name: "Masker Respirator", defaultQuantity: 1, units: .pcs, layer: .mountainEssential, category: .safetyTools, mountains: [ijen]),
        .init(name: "Peralatan Panjat", defaultQuantity: 1, units: .set, layer: .mountainEssential, category: .safetyTools, mountains: [carstensz, trikora])
    ]
}
