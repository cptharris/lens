import Foundation

struct ContactLens: Identifiable {
	let id: UUID = UUID()
	var name: String
	var brand: ContactLensBrand
	var sideEye: SideEye = .pair
	
	enum SideEye: String {
		case left
		case right
		case pair
	}
}

struct ContactLensBrand {
	var name: String
	var replace: ReplacementSchedule
	
	init(_ name: String, replace: ReplacementSchedule = .monthly) {
		self.name = name
		self.replace = replace
	}
	
	enum ReplacementSchedule {
		case daily
		case weekly
		case biweekly
		case monthly
	}
}

extension ContactLens {
	static let sampleData =
	[
		ContactLens(name: "1", brand: ContactLensBrand("AccurateVision", replace: .biweekly), sideEye: .left),
		ContactLens(name: "2", brand: ContactLensBrand("AccurateVision", replace: .biweekly), sideEye: .right),
		ContactLens(name: "3", brand: ContactLensBrand("NewView", replace: .monthly))
	]
}
