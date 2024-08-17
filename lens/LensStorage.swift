import Foundation

@MainActor
class LensStorage: ObservableObject {
	@Published var lensList: [ContactLens] = []
	
	init(lensList: [ContactLens]) {
		self.lensList = lensList
	}
}
