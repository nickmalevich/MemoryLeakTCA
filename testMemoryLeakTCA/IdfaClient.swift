import Dependencies

struct IdfaClient {
    let request: @Sendable () async -> Void
}

extension DependencyValues {
    var idfaClient: IdfaClient {
        get { self[IdfaClient.self] }
        set { self[IdfaClient.self] = newValue }
    }
}
