import ComposableArchitecture
import Foundation

struct RootFeature: Reducer {
    struct State {}

    enum Action {
        case appDelegate(AppDelegate)

        enum AppDelegate {
            case didBecomeActive
        }
    }

    @Dependency(\.idfaClient) var idfaClient

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .appDelegate(.didBecomeActive):
                return .run { _ in
                    await idfaClient.request()
                }
            }
        }
    }
}
