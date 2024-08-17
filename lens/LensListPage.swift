import SwiftUI

struct LensListPage: View {
	@Binding var lensList: [ContactLens]
	@State private var isPresentingLensStore = false
	
    var body: some View {
		NavigationStack {
			List($lensList) { $lens in
				ContactLensCardView(contactLens: $lens)
					.swipeActions {
						Button(action: {
							lens.wornToday = !lens.wornToday
						}) {
							Text(!lens.wornToday ? "Worn" : "Not Worn")
						}
					}
					.listRowBackground(lens.daysRemaining < 0 ? Color.red : Color.clear)
			}
			.navigationTitle("Contact Lenses")
			.toolbar {
				Button(action: {isPresentingLensStore = true}) {
					Image(systemName: "cart")
				}
			}
		}
		.sheet(isPresented: $isPresentingLensStore) {
			LensStoreView(isPresented: $isPresentingLensStore)
		}
    }
}

#Preview {
	LensListPage(lensList: .constant(ContactLens.sampleData))
}
