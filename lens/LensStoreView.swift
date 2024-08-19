import SwiftUI

struct LensStoreView: View {
	@Binding var lensList: [ContactLens]
	@Binding var brandList: [ContactLensBrand]
	@Binding var isPresentingLensStore: Bool
	
	@State private var isPresentingNewLensPrompt: Bool = false
	@State private var newLens: ContactLens = ContactLens(name: "", brand: ContactLensBrand(""))
	
	@State private var isPresentingNewBrandPrompt: Bool = false
	@State private var newBrand: ContactLensBrand = ContactLensBrand("")
	
    var body: some View {
		NavigationStack {
			BrandList()
				.navigationTitle("Lens Store")
				.toolbar {
					Button(action: {
						isPresentingNewBrandPrompt = true
					}, label: {
						Image(systemName: "plus")
					})
				}
		}
		.sheet(isPresented: $isPresentingNewLensPrompt) {
			NewLensPromptView(
				lensList: $lensList,
				newLens: $newLens,
				isPresentingNewLensPrompt: $isPresentingNewLensPrompt,
				isPresentingLensStore: $isPresentingLensStore
			)
		}
		.sheet(isPresented: $isPresentingNewBrandPrompt) {
			NewBrandPromptView(
				brandList: $brandList,
				newBrand: $newBrand,
				isPresentingNewBrandPrompt: $isPresentingNewBrandPrompt
			)
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
