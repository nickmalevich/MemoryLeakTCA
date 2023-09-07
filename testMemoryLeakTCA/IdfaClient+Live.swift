// System
import AppTrackingTransparency

// SDK
import Dependencies

extension IdfaClient: DependencyKey {
    static let liveValue = Self {
         _ = await ATTrackingManager.requestTrackingAuthorization()
    }
}
