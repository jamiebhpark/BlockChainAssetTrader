import Foundation
import Combine

class AppState: ObservableObject {
    @Published var token: String = "" {
        didSet {
            print("Token updated: \(token)")
        }
    }
}
