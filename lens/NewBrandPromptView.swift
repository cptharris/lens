import SwiftUI

struct NewBrandPromptView: View {
	@Binding var brandList: [ContactLensBrand]
	@Binding var newBrand: ContactLensBrand
	@Binding var isPresentingNewBrandPrompt: Bool
	
    var body: some View {
		NavigationStack {
			Form {
				TextField("Brand Name", text: $newBrand.name)
				
				Picker("Replacement Schedule", selection: $newBrand.replace) {
					ForEach(ContactLensBrand.ReplacementSchedule.allCases, id: \.self) { c in
						Text(c.rawValue)
					}
				}
				
				AddBrandButton()
			}
			.navigationTitle("New Brand")
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel", role: .cancel, action: {
						isPresentingNewBrandPrompt = false
					})
				}
			}
		}
    }
	
	private func AddBrandButton() -> some View {
		HStack {
			Spacer()
			
			Button("Add Brand", action: {
				brandList.append(newBrand)
				isPresentingNewBrandPrompt = false
			})
			.disabled(newBrand.name == "")
			
			Spacer()
		}
	}
}

#Preview {
	NewBrandPromptView(brandList: .constant(ContactLensBrand.sampleData), newBrand: .constant(ContactLensBrand("")), isPresentingNewBrandPrompt: .constant(true))
}
