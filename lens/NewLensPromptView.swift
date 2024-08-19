import SwiftUI

struct NewLensPromptView: View {
	@Binding var lensList: [ContactLens]
	@Binding var newLens: ContactLens
	@Binding var isPresentingNewLensPrompt: Bool
	@Binding var isPresentingLensStore: Bool
	
	var body: some View {
		NavigationStack {
			NewLensForm()
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
	
	private func NewLensForm() -> some View {
		Form {
			Text("Adding a " + newLens.brand.name + " lens with " + newLens.brand.replace.rawValue + " replacement.")
			
			TextField("Lens Name", text: $newLens.name, axis: .vertical)
			
			AddLensButton()
		}
	}
	
	private func AddLensButton() -> some View {
		HStack {
			Spacer()
			
			Button("Add Lens", action: {
				lensList.append(newLens)
				isPresentingNewLensPrompt = false
			})
			.disabled(newLens.name == "")
			
			Spacer()
			
			Button("Add Lens & Close", action: {
				lensList.append(newLens)
				isPresentingNewLensPrompt = false
				isPresentingLensStore = false
			})
			.disabled(newLens.name == "")
			
			Spacer()
		}
	}
}

#Preview {
    NewLensPromptView(
		lensList: .constant(ContactLens.sampleData),
		newLens: .constant(ContactLens(name: "", brand: ContactLensBrand(""))),
		isPresentingNewLensPrompt: .constant(false),
		isPresentingLensStore: .constant(true)
	)
}
