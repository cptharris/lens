import SwiftUI

struct ContactLensCardView: View {
	@Binding var contactLens: ContactLens
	
    var body: some View {
		VStack {
			HStack {
				HStack {
					Image(systemName: "eye.circle.fill")
						.foregroundStyle(contactLens.wornToday ? Color.green : Color.black)
						.onTapGesture {
							contactLens.wornToday = !contactLens.wornToday
						}
					Text(contactLens.name)
				}
				
				Spacer()
				
				Text(contactLens.sideEye.rawValue)
			}
			
			HStack {
				Text(contactLens.brand.name.padding(toLength: 25, withPad: " ", startingAt: 0))
				
				Spacer()
				
				Text(contactLens.brand.replace.rawValue)
			}
			
			HStack {
				if (contactLens.daysRemaining >= 0) {
					Text("Expires: ")
					if (contactLens.daysRemaining == 1) {
						Text("Tomorrow")
					} else if (contactLens.daysRemaining == 0) {
						Text("Today")
					} else {
						Text(Date().addingTimeInterval(24 * 60 * 60 * Double(contactLens.daysRemaining)).formatted(date: .abbreviated, time: .omitted))
					}
				} else {
					Text("EXPIRED")
					Text("Overused by " + (-contactLens.daysRemaining).formatted() + " days")
				}
				
			}
		}
    }
}

#Preview {
	ContactLensCardView(contactLens: .constant(ContactLens.sampleData[2]))
}
