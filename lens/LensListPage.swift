import SwiftUI

struct LensListPage: View {
	@Binding var lensList: [ContactLens]
	@State private var isPresentingLensStore = false
	
    var body: some View {
		NavigationStack {
			List($lensList) { lens in
				NavigationLink(destination: ManageLensView(lens: lens)) {
					ContactLensCardView(contactLens: lens)
				}
			}
			.navigationTitle("Contact Lenses")
			.toolbar {
				Button(action: {isPresentingLensStore = true}) {
					Image(systemName: "cart")
				}
			}
		}
		.sheet(isPresented: $isPresentingLensStore) {
			NavigationStack {
				Text("lens store things here!")
					.navigationTitle("Lens Store")
					.toolbar {
						Button(action: {isPresentingLensStore = false}) {
							Text("Done")
						}
					}
			}
		}
    }
}

#Preview {
	LensListPage(lensList: .constant(ContactLens.sampleData))
}
