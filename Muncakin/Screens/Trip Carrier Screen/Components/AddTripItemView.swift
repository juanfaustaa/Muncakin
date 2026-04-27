//
//  AddTripItemView.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI
import SwiftData

struct AddTripItemView: View {
    let trip: Trip
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var quantity = 1
    @State private var gramasi = 0
    @State private var units: ItemUnits = .pcs
    @State private var category: ItemCategories = .others
    @State private var ownership: ItemOwnerships = .owned
    @State private var notes = ""
    
    var isValid: Bool { !name.trimmingCharacters(in: .whitespaces).isEmpty }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Barang") {
                    TextField("Nama barang", text: $name)
                    Picker("Satuan", selection: $units) {
                        ForEach(ItemUnits.allCases, id: \.self) { u in
                            Text(u.label).tag(u)
                        }
                    }
                    if units == .gram {
                        TextField("Gramasi", value: $gramasi, format: .number)
                            .keyboardType(.numberPad)
                    }
                    else {
                        Stepper("Jumlah: \(quantity)", value: $quantity, in: 1...999)
                    }
                }
                
                Section("Kategori & Status") {
                    Picker("Kategori", selection: $category) {
                        ForEach(ItemCategories.allCases, id: \.self) { c in
                            Text(c.label).tag(c)
                        }
                    }
                    Picker("Status", selection: $ownership) {
                        ForEach(ItemOwnerships.allCases, id: \.self) { o in
                            Text(o.label).tag(o)
                        }
                    }
                }
                
                Section("Catatan (opsional)") {
                    TextField("Tulis catatan...", text: $notes, axis: .vertical)
                        .lineLimit(3)
                }
            }
            .navigationTitle("Tambah Barang")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Batal") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Tambah") {
                        let item = TripItem(
                            name: name,
                            quantity: quantity,
                            units: units,
                            layer: .additional,
                            category: category,
                            ownership: ownership,
                            notes: notes.isEmpty ? nil : notes,
                            trip: trip
                        )
                        context.insert(item)
                        trip.items.append(item)
                        dismiss()
                    }
                    .disabled(!isValid)
                }
            }
        }
    }
}
