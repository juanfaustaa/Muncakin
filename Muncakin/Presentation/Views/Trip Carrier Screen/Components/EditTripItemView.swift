//
//  EditTripItemView.swift
//  Challenge2Juan
//

import SwiftUI
import SwiftData

struct EditTripItemView: View {

    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    @Bindable var item: TripItem

    var isValid: Bool { !item.name.trimmingCharacters(in: .whitespaces).isEmpty }

    var body: some View {
        NavigationStack {
            Form {
                Section("Barang") {
                    TextField("Nama barang", text: $item.name)
                    Picker("Satuan", selection: $item.units) {
                        ForEach(ItemUnits.allCases, id: \.self) { u in
                            Text(u.label).tag(u)
                        }
                    }
                    if item.units == .gram {
                        TextField("Gramasi", value: $item.quantity, format: .number)
                            .keyboardType(.numberPad)
                    } else {
                        Stepper("Jumlah: \(item.quantity)", value: $item.quantity, in: 1...999)
                    }
                }

                Section("Kategori & Status") {
                    Picker("Kategori", selection: $item.category) {
                        ForEach(ItemCategories.allCases, id: \.self) { c in
                            Text(c.label).tag(c)
                        }
                    }
                    Picker("Status", selection: $item.ownership) {
                        ForEach(ItemOwnerships.allCases, id: \.self) { o in
                            Text(o.label).tag(o)
                        }
                    }
                }

                Section("Catatan (opsional)") {
                    TextField("Tulis catatan...", text: Binding(
                        get: { item.notes ?? "" },
                        set: { item.notes = $0.isEmpty ? nil : $0 }
                    ), axis: .vertical)
                    .lineLimit(3)
                }
            }
            .navigationTitle("Ubah Barang")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Batal") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Simpan") {
                        dismiss()
                    }
                    .disabled(!isValid)
                }
            }
        }
    }
}
