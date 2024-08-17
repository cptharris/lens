import SwiftUI

struct ContactLensCardView: View {
	@Binding var contactLens: ContactLens
	@State var wornToday = false
	
    var body: some View {
		VStack {
			HStack {
				HStack {
					Image(systemName: "eye.circle.fill")
					Text(contactLens.name)
				}
				.font(.headline)
				
				Spacer()
				
				Text(contactLens.sideEye.rawValue)
					.font(.caption)
			}
			
			HStack {
				Text(contactLens.brand.name)
					.font(.caption)
				
				Spacer()
				
				Button(action: {
					wornToday = !wornToday
				}) {
					Text(wornToday ? "Was Worn" : "Not Worn")
						.font(.system(size: 15).monospaced())
						.padding(5)
						.foregroundStyle(.black)
						.background {
							RoundedRectangle(cornerRadius: 10).fill(wornToday ? Color.green : Color.red)
						}
				}
			}
		}
    }
}

#Preview {
	ContactLensCardView(contactLens: .constant(ContactLens.sampleData[2]))
}
