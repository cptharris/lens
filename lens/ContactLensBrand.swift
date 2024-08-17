import Foundation

struct ContactLensBrand {
	var name: String
	var replace: ReplacementSchedule
	
	init(_ name: String, replace: ReplacementSchedule = .monthly) {
		self.name = name
		self.replace = replace
	}
	
	var replaceAfter: Int {
		switch replace {
		case .daily: 1
		case .weekly: 7
		case .biweekly: 14
		case .monthly: 30
		}
	}
	
	enum ReplacementSchedule: String {
		case daily
		case weekly
		case biweekly
		case monthly
	}
}
