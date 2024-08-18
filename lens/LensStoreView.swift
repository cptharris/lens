import SwiftUI

struct LensStoreView: View {
	@Binding var brandList: [ContactLensBrand]
	@Binding var isPresented: Bool
	@Binding var newLens: (ContactLens, Bool)
	@State private var isPresentingAddLens = false
	
    var body: some View {
		NavigationStack {
			List(brandList) { brand in
				VStack(alignment: .leading) {
					Text(brand.name)
					Text(brand.replace.rawValue)
				}
				.swipeActions {
					Button(action: {
						newLens.0.brand = brand
						isPresentingAddLens = true
					}, label: {
						Image(systemName: "plus")
					}).tint(Color.green)
				}
				.swipeActions(edge: .leading) {
					Button(role: .destructive, action: {
						brandList.removeAll(where: {b in b.id == brand.id})
					}, label: {
						Text("Delete")
					})
				}
			}
			.navigationTitle("Lens Store")
			.toolbar {
				ToolbarItem {
					Button(action: {
						isPresented = false
					}) {
						Text("Done")
					}
				}
				ToolbarItem(placement: .bottomBar) {
					Button(action: {
						
					}, label: {
						Text("Add New Brand")
					})
				}
			}
		}
		// alert to add new lens to the lens list
		.alert("Lens Name", isPresented: $isPresentingAddLens) {
			ScrollView {
				Button("Done", action: {
					print(newLens)
					isPresentingAddLens = false
					isPresented = false
					newLens.1 = true
				})
				.disabled(newLens.0.name == "")
				
				Button("Cancel", role: .cancel, action: {
					newLens.0.name = ""
					isPresentingAddLens = false
				})
				
				TextField("Name", text: $newLens.0.name)
			}
		}
    }
}

#Preview {
	LensStoreView(brandList: .constant(ContactLensBrand.sampleData), isPresented: .constant(true), newLens: .constant((ContactLens(name: "", brand: ContactLensBrand("")), false)))
}
