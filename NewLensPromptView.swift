import SwiftUI

struct NewLensPromptView: View {
	@Binding var lensList: [ContactLens]
	@Binding var newLens: ContactLens
	@Binding var isPresentingNewLensPrompt: Bool
	
	var body: some View {
		NavigationStack {
			Form {
				Text("Name your new " + newLens.brand.name + " lens with " + newLens.brand.replace.rawValue + " replacement.")
				
				TextField("Lens Name", text: $newLens.name)
				
				Button(action: {
					lensList.append(newLens)
					isPresentingNewLensPrompt = false
				}, label: {
					HStack { Spacer(); Text("Add Lens"); Spacer() }
				})
				.disabled(newLens.name == "")
			}
			.navigationTitle("Name New Lens")
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel", role: .cancel, action: {
						isPresentingNewLensPrompt = false
					})
				}
			}
		}
	}
}

#Preview {
    NewLensPromptView(
		lensList: .constant(ContactLens.sampleData),
		newLens: .constant(ContactLens(name: "", brand: ContactLensBrand(""))),
		isPresentingNewLensPrompt: .constant(false)
	)
}
