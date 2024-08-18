import Foundation

struct ContactLens: Identifiable {
	let id: UUID = UUID()
	var name: String
	var brand: ContactLensBrand
	var sideEye: SideEye = .pair
	var assumeUsed: Bool = false
	var datesUsed: [Date] = []
	
	var daysRemaining: Int {
		brand.replaceAfter - datesUsed.count
	}
	
	var wornToday: Bool {
		get {
			let today = Date()
			return datesUsed.contains(where: { date in
				Calendar.current.isDate(today, equalTo: date, toGranularity: .day)
			})
		}
		set {
			if (newValue) {
				datesUsed.append(Date())
			} else {
				let today = Date()
				datesUsed.removeAll(where: { date in
					Calendar.current.isDate(today, equalTo: date, toGranularity: .day)
				})
			}
		}
	}
	
	enum SideEye: String {
		case left
		case right
		case pair
	}
	
	static let emptyLens = ContactLens(name: "", brand: ContactLensBrand(""))
}

extension ContactLens {
	static let sampleData =
	[
		ContactLens(name: "1", brand: ContactLensBrand("AccurateVision", replace: .biweekly), sideEye: .left),
		ContactLens(name: "2", brand: ContactLensBrand("AccurateVision", replace: .biweekly), sideEye: .right),
		ContactLens(name: "3", brand: ContactLensBrand("NewView", replace: .monthly)),
		ContactLens(name: "Alpha", brand: ContactLensBrand("SuperClear"), datesUsed: [Date()]),
		ContactLens(name: "Beta", brand: ContactLensBrand("SuperClear", replace: .daily), datesUsed: [Date().addingTimeInterval(-86400), Date().addingTimeInterval(-86400 * 2)]),
	]
}
