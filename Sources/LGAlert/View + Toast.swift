import SwiftUI

public extension View {
    func toastRoot() -> some View {
        ToastRootView {
            self
        }
    }
}
