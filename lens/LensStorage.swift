import Foundation

@MainActor
class LensStorage: ObservableObject {
	@Published var lensList: [ContactLens] = []
	var brandList: [ContactLensBrand] = []
	
	init(lensList: [ContactLens], brandList: [ContactLensBrand]) {
		self.lensList = lensList
		self.brandList = brandList
	}
}
