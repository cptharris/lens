import Foundation

struct ContactLens: Identifiable {
	let id: UUID = UUID()
	var overnight: Bool
	var brand: String
	var name: String
	var time: DateInterval
	
	init(startDate: Date = Date.now, replacementSchedule: ReplacementSchedule, overnight: Bool = false, brand: String = "Unknown", name: String = "New Lens") {
		self.time = DateInterval(start: startDate, duration: TimeInterval.secondsPerDay * Double(replacementSchedule.frequency))
		self.overnight = overnight
		self.brand = brand
		self.name = name
	}
	
	var expired: Bool {
		time.end.distance(to: Date.now) >= TimeInterval.secondsPerDay
	}
	
	mutating func skipDay() -> Void {
		time.duration += TimeInterval.secondsPerDay
	}
	
	enum ReplacementSchedule {
		case daily
		case weekly
		case biweekly
		case monthly
		
		var frequency: Int {
			switch self {
			case .daily: return 1
			case .weekly: return 7
			case .biweekly: return 14
			case .monthly: return 30
			}
		}
	}
}

extension TimeInterval {
	static let secondsPerDay: TimeInterval = 24*60*60
}

extension ContactLens {
	static let sampleData =
	[
		ContactLens(startDate: Date.now, replacementSchedule: .weekly, overnight: false, brand: "FunNewBrand", name: "Best Lens"),
		ContactLens(startDate: Date.now - TimeInterval.secondsPerDay * 2, replacementSchedule: .daily, overnight: false, brand: "CleanLens", name: "Test"),
		ContactLens(startDate: Date.now, replacementSchedule: .monthly, overnight: true, brand: "ClearLux", name: "Fav Lens!")
	]
}
