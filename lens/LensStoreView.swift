import SwiftUI

struct LensStoreView: View {
	@Binding var isPresented: Bool
	
    var body: some View {
		NavigationStack {
			Text("lens store things here!")
				.navigationTitle("Lens Store")
				.toolbar {
					Button(action: {isPresented = false}) {
						Text("Done")
					}
				}
		}
    }
}

#Preview {
	LensStoreView(isPresented: .constant(true))
}
