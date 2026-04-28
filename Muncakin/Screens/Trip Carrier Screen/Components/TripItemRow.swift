//
//  TripItemRow.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI
import SwiftData

struct TripItemRow: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @Bindable var item: TripItem
    
    @State private var editTripItem: TripItem?
    @State private var isWantToDelete: Bool = false
    
    private var isDeleteable: Bool {
        return (item.layer == .additional || item.layer == .essentialOptional)
    }
    
    var body: some View {
        HStack(spacing: 12) {
            // Checkbox
            Button {
                withAnimation(.easeIn(duration: 0.4)){
                    item.isPacked.toggle()
                }
            } label: {
                Image(systemName: item.isPacked
                      ? "checkmark.circle.fill"
                      : "circle")
                .font(.title2)
                .foregroundStyle(item.isPacked ? .green : .secondary)
            }
            .buttonStyle(.plain)
            
            // Info item
            Button {
                editTripItem = item
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(item.name)
                                .lineLimit(1)
                                .font(.body)
                                .fontWeight(.medium)
                            if item.layer == .mountainEssential {
                                Image(systemName: "mountain.2.fill")
                                    .font(.caption2)
                                    .foregroundStyle(.orange)
                            }
                            else if item.layer == .essential {
                                Image(systemName: "exclamationmark.circle.fill")
                                    .font(.caption2)
                                    .foregroundStyle(.red)
                            }
                        }
                        
                        HStack {
                            if item.ownership.label == "Pribadi" {
                                Text(item.ownership.label)
                                    .bold()
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 4)
                                    .background(.blue.opacity(0.15))
                                    .foregroundStyle(.blue)
                                    .clipShape(Capsule())
                            }
                            
                            else if item.ownership.label == "Kelompok" {
                                Text(item.ownership.label)
                                    .bold()
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 4)
                                    .background(.purple.opacity(0.15))
                                    .foregroundStyle(.purple)
                                    .clipShape(Capsule())
                            }
                            
                            else if item.ownership.label == "Sewa" {
                                Text(item.ownership.label)
                                    .bold()
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 4)
                                    .background(.orange.opacity(0.15))
                                    .foregroundStyle(.orange)
                                    .clipShape(Capsule())
                            }


                            
                            if item.notes?.isEmpty == false {
                                Text("Notes")
                                    .bold()
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 4)
                                    .background(.yellow.opacity(0.15))
                                    .foregroundStyle(.yellow)
                                    .clipShape(Capsule())
                            }
                        }
                        .font(.caption)
                    }
                    .font(.caption)
                    .tint(.primary)
                    Spacer()
                    
                    Text("\(item.quantity) \(item.units.label)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .tint(.primary)
                }
            }
        }
        .opacity(item.isPacked ? 0.5 : 1)
        .sheet(item: $editTripItem) { tripItem in
            EditTripItemView(item: tripItem)
        }
        .swipeActions{
            Button {
                isWantToDelete = true
            } label: {
                Label("Delete", systemImage: "trash")
                    .symbolVariant(.fill)
                    .tint(.red)
            }
        }
        .alert(isDeleteable ? "Hapus Item?" : "Barang tidak dapat dihapus." , isPresented: $isWantToDelete) {
            
            if isDeleteable {
                Button("Hapus", role: .destructive) {
                    context.delete(item)
                }
                Button("Batal", role: .cancel) {}
            }
        } message: {
            if isDeleteable {
                Text("Apakah kamu yakin untuk menghapus \(item.name) dari daftar barang kamu?")
            }
            else {
                Text("Item ini tidak dapat dihapus karena penting untuk pendakianmu!")
            }
        }
    }
}
