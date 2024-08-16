import SwiftUI

@main
struct lensApp: App {
    var body: some Scene {
        WindowGroup {
			ContactLensCardView(contactLens: .constant(ContactLens.sampleData[0]))
        }
    }
}
