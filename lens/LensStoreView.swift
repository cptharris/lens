import SwiftUI

struct LensStoreView: View {
	@Binding var lensList: [ContactLens]
	@Binding var brandList: [ContactLensBrand]
	@Binding var isPresentingLensStore: Bool
	
	@State private var isPresentingNewLensPrompt: Bool = false
	@State private var newLens: ContactLens = ContactLens(name: "", brand: ContactLensBrand(""))
	
    var body: some View {
		NavigationStack {
			BrandList()
				.navigationTitle("Lens Store")
				.toolbar {
					Button(action: {
						
					}, label: {
						Image(systemName: "plus")
					})
				}
		}
		.popover(isPresented: $isPresentingNewLensPrompt) {
			NewLensPromptView(
				lensList: $lensList,
				newLens: $newLens,
				isPresentingNewLensPrompt: $isPresentingNewLensPrompt)
		}
    }
	
	private func BrandList() -> some View {
		List(brandList) { brand in
			VStack(alignment: .leading) {
				Text(brand.name)
				Text(brand.replace.rawValue + " replacement")
			}
			.onTapGesture {
				newLens.brand = brand
				isPresentingNewLensPrompt = true
			}
			.swipeActions(edge: .leading) {
				Button(role: .destructive, action: {
					brandList.removeAll(where: {b in b.id == brand.id})
				}, label: {
					Text("Delete")
				})
			}
		}
	}
}

#Preview {
	LensStoreView(
		lensList: .constant(ContactLens.sampleData),
		brandList: .constant(ContactLensBrand.sampleData),
		isPresentingLensStore: .constant(true)
	)
}
