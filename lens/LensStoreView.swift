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
						isPresentingAddLens = true
					}) {
						Image(systemName: "plus")
					}
				}
			}
				.navigationTitle("Lens Store")
				.toolbar {
					Button(action: {isPresented = false}) {
						Text("Done")
					}
				}
		}
		.sheet(isPresented: $isPresentingAddLens) {
			NavigationStack {
				Form {
					TextField("Name", text: $newLens.0.name)
				}
					.navigationTitle("Add Lens")
					.toolbar {
						Button(action: {isPresentingAddLens = false}) {
							Text("Done")
						}
					}
			}
		}
    }
}

#Preview {
	LensStoreView(brandList: .constant(ContactLensBrand.sampleData), isPresented: .constant(true), newLens: .constant((ContactLens(name: "", brand: ContactLensBrand("")), false)))
}
