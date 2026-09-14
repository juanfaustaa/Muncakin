//
//  AddTripItemView.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI

struct AddTripItemView: View {
    
    @State var viewModel: AddTripItemViewModel
    let dependencies: AppDependencies
    @Environment(\.dismiss) var dismiss
    let onSaved: (TripItem) -> Void
    
    var body: some View {
        @Bindable var viewModel = viewModel
        NavigationStack {
            Form {
                Section("Barang") {
                    TextField("Nama barang", text: $viewModel.name)
                    Picker("Satuan", selection: $viewModel.units) {
                        ForEach(ItemUnits.allCases, id: \.self) { u in
                            Text(u.label).tag(u)
                        }
                    }
                    if viewModel.units == .gram {
                        TextField("Gramasi", value: $viewModel.gramasi, format: .number)
                            .keyboardType(.numberPad)
                    }
                    else {
                        Stepper("Jumlah: \(viewModel.quantity)", value: $viewModel.quantity, in: 1...999)
                    }
                }
                
                Section("Kategori & Status") {
                    Picker("Kategori", selection: $viewModel.category) {
                        ForEach(ItemCategories.allCases, id: \.self) { c in
                            Text(c.label).tag(c)
                        }
                    }
                    Picker("Status", selection: $viewModel.ownership) {
                        ForEach(ItemOwnerships.allCases, id: \.self) { o in
                            Text(o.label).tag(o)
                        }
                    }
                }
                
                Section("Catatan (opsional)") {
                    TextField("Tulis catatan...", text: $viewModel.notes, axis: .vertical)
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
                        do {
                            let newItem = try viewModel.addItem()
                            onSaved(newItem)
                            dismiss()
                        } catch {
                            
                        }
                    }
                    .disabled(!viewModel.isValid)
                }
            }
        }
    }
}
