import SwiftUI

struct ManageLensView: View {
	@Binding var lens: ContactLens
	
    var body: some View {
        Text("manage this new lens!")
    }
}

#Preview {
	ManageLensView(lens: .constant(ContactLens.sampleData[0]))
}
