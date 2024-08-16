import SwiftUI

struct ContactLensCardView: View {
	@Binding var contactLens: ContactLens
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				HStack {
					Image(systemName: "eye.circle.fill")
					Text(contactLens.name)
					if contactLens.overnight {
						Image(systemName: "moon")
					}
				}
				.font(.headline)
				
				Spacer()
				
				Text(contactLens.brand)
					.font(.caption)
			}
			
			HStack {
				Text("\(contactLens.time)")
				
				Spacer()
				
				Button(action: {contactLens.skipDay()}) {
					Image(systemName: "plus")
				}
				.foregroundStyle(Color.black)
			}
		}
		.padding(4)
		.background(Rectangle().fill(Color.blue).border(Color.black))
		.padding(4)
    }
}

#Preview {
	ContactLensCardView(contactLens: .constant(ContactLens.sampleData[2]))
}
