import SwiftUI

struct OnboardingSheet: View {
    @Binding var hasSeenOnboarding: Bool
    @State private var currentPage = 0
    
    private let onboardings = [
        Onboarding(title: "Pilih Gunung Tujuan", description: "Pilih 30 gunung yang ada di seluruh Indonesia.", image: "mountain.2.fill"),
        Onboarding(title: "Isi Detil Pendakian", description: "Masukkan jumlah pendaki serta tanggal turun dan naik pendakian.", image: "square.and.pencil"),
        Onboarding(title: "List Packing Dinamis", description: "Tidak perlu membuat list packing dari awal! Barang esensial untuk setiap pendakian sudah kami siapkan!", image: "list.clipboard.fill"),
        Onboarding(title: "Mulai Packing!", description: "Mulai jelajahi gunung dan persiapkan pendakian Anda!", image: "backpack.fill")
    ]
    
    private var isLastPage: Bool {
        currentPage == onboardings.count - 1
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentPage) {
                ForEach(onboardings.indices, id: \.self) { index in
                    VStack {
                        Image(systemName: onboardings[index].image)
                            .font(.system(size: 50))
                            .padding(25)
                            .foregroundStyle(.primary)
                            .background(.green.opacity(0.85))
                            .clipShape(Circle())
                            .padding()
                        
                        Text(onboardings[index].title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text(onboardings[index].description)
                            .fontWeight(.medium)
                            .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page)
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .label
                UIPageControl.appearance().pageIndicatorTintColor = .systemGray
            }
            

            VStack {
                if isLastPage {
                    Button {
                        hasSeenOnboarding = true
                    } label: {
                        Text("Mulai")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.green)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 60))
                    }
                } else {
                    Button {
                        withAnimation {
                            currentPage += 1
                        }
                    } label: {
                        Text("Selanjutnya")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.green)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 60))
                    }
                }
            }
            .animation(.easeInOut, value: isLastPage)
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .interactiveDismissDisabled()
    }
}
