//
//  EditTripItemView.swift
//  Challenge2Juan
//

import SwiftUI

struct EditTripItemView: View {
    
    @State var viewModel: EditTripItemViewModel
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
                        TextField("Gramasi", value: $viewModel.quantity, format: .number)
                            .keyboardType(.numberPad)
                    } else {
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
                    TextField("Tulis catatan...", text: Binding(
                        get: { viewModel.notes ?? "" },
                        set: { viewModel.notes = $0.isEmpty ? nil : $0 }
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
                        
                        do{
                            let updatedItem = try viewModel.saveChanges()
                            onSaved(updatedItem)
                            dismiss()
                        }catch {
                            //
                        }
                        
                    }
                    .disabled(!viewModel.isValid)
                }
            }
        }
    }
}
