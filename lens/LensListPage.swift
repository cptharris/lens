import SwiftUI

struct LensListPage: View {
	@Binding var lensList: [ContactLens]
	@Binding var brandList: [ContactLensBrand]
	@State private var isPresentingLensStore = false
	@State private var newLens = (ContactLens.emptyLens, false)
	
    var body: some View {
		NavigationStack {
			ContactLensList()
				.navigationTitle("Contact Lenses")
				.toolbar {
					Button(action: {isPresentingLensStore = true}) {
						Image(systemName: "cart")
					}
				}
		}
		// present the lens store in LensStoreView.swift
		.sheet(isPresented: $isPresentingLensStore) {
			LensStoreView(brandList: $brandList, isPresented: $isPresentingLensStore, newLens: $newLens)
		}
		// if the newLens status changes
		.onChange(of: newLens.1, {
			if (newLens.1) {
				lensList.append(newLens.0)
			}
			newLens = (ContactLens.emptyLens, false)
		})
    }
	
	private func ContactLensList() -> some View {
		List($lensList) { $lens in
			ContactLensCardView(lens: $lens)
				.swipeActions {
					Button(action: {
						lens.wornToday = !lens.wornToday
					}, label: {
						Text(!lens.wornToday ? "Worn" : "Not Worn")
					})
				}
				.swipeActions(edge: .leading) {
					Button(role: .destructive, action: {
						lensList.removeAll(where: {l in l.id == lens.id})
					}, label: {
						Text("Delete")
					})
				}
				.listRowBackground(lens.daysRemaining < 0 ? Color.red : Color.white)
		}
	}
}

#Preview {
	LensListPage(lensList: .constant(ContactLens.sampleData), brandList: .constant(ContactLensBrand.sampleData))
}
