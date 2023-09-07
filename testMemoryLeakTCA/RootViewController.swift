// System
import Combine
import UIKit

// SDK
import ComposableArchitecture

final class RootViewController: UIViewController {
    private typealias C = RootConstants

    // MARK: - Private properties
    private var cancellables: Set<AnyCancellable> = []
    private let store: StoreOf<RootFeature>
    let viewStore: ViewStore<ViewState, ViewAction>

    // MARK: - Init
    init(store: StoreOf<RootFeature>) {
        self.store = store
        self.viewStore = .init(store, observe: ViewState.init, send: RootFeature.Action.init)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupItems()
    }
}

private extension RootViewController {
    // MARK: - Setup items
    func setupItems() {
        setupUI()
        setupVS()
    }

    func setupUI() {
        view.backgroundColor = .red
    }

    func setupVS() {}
}

private extension RootViewController {
    // MARK: - Setup UI

}

extension RootViewController {
    // MARK: - View feature
    struct ViewState: Equatable {
        init(state: RootFeature.State) {}
    }

    enum ViewAction {
        case appDelegate(AppDelegate)

        enum AppDelegate {
            case didBecomeActive
        }
    }
}

private extension RootFeature.Action {
    // MARK: - Action init
    init(action: RootViewController.ViewAction) {
        switch action {
        case .appDelegate(.didBecomeActive):
            self = .appDelegate(.didBecomeActive)
        }
    }
}
