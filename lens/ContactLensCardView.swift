import SwiftUI

/// Displays information about a lens in a card format
/// - Parameter lens: ContactLens to be displayed
struct ContactLensCardView: View {
	@Binding var lens: ContactLens
	
    var body: some View {
		VStack {
			HStack {
				Icon_Name()
				
				Spacer()
				
				Text(lens.sideEye.rawValue)
			}
			
			Brand_Info()
			
			Expiration_Info()
		}
    }
	
	/// Display eye icon (toggles wornToday) and lens name
	private func Icon_Name() -> some View {
		HStack {
			Image(systemName: "eye.circle.fill")
				.foregroundStyle(lens.wornToday ? Color.green : Color.black)
				.onTapGesture {
					lens.wornToday = !lens.wornToday
				}
			
			Text(lens.name)
		}
	}
	
	/// Displays brand name (padded) and replacement cycle
	private func Brand_Info() -> some View {
		HStack {
			Text(lens.brand.name.padding(toLength: 25, withPad: " ", startingAt: 0))
			
			Spacer()
			
			Text(lens.brand.replace.rawValue)
		}
	}
	
	/// Displays expiration date or information about overuse
	private func Expiration_Info() -> some View {
		HStack {
			if (lens.daysRemaining >= 0) {
				Text("Expires: ")
				if (lens.daysRemaining == 1) {
					Text("Tomorrow")
				} else if (lens.daysRemaining == 0) {
					Text("Today")
				} else {
					Text(Date().addingTimeInterval(86400 * Double(lens.daysRemaining)).formatted(date: .abbreviated, time: .omitted))
				}
			} else {
				Text("EXPIRED: overused by " + OverusedFormatted())
			}
		}
		.foregroundStyle(lens.daysRemaining < 0 ? Color.red : (lens.daysRemaining < 2 ? Color.yellow : Color.black))
	}
	
	private func OverusedFormatted() -> String {
		(-lens.daysRemaining).formatted() + " day" + ((-lens.daysRemaining) != 1 ? "s" : "")
	}
}

#Preview {
	ContactLensCardView(lens: .constant(ContactLens.sampleData[2]))
}
