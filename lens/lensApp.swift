import SwiftUI

@main
struct lensApp: App {
//	@StateObject private var storage = LensStorage()
	@StateObject private var storage = LensStorage(lensList: ContactLens.sampleData, brandList: ContactLensBrand.sampleData)
	
    var body: some Scene {
        WindowGroup {
			LensListPage(lensList: $storage.lensList, brandList: $storage.brandList)
        }
    }
}
