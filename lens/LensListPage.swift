import SwiftUI

struct LensListPage: View {
	@Binding var lensList: [ContactLens]
	@Binding var brandList: [ContactLensBrand]
	
	var body: some View {
		NavigationStack {
			ContactLensList()
				.navigationTitle("Contact Lenses")
				.toolbar {
					NavigationLink(destination: {
						LensStoreView(lensList: $lensList, brandList: $brandList)
					}, label: {
						Image(systemName: "cart")
					})
				}
		}
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
		}
	}
}

#Preview {
	LensListPage(lensList: .constant(ContactLens.sampleData), brandList: .constant(ContactLensBrand.sampleData))
}
