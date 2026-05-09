import SwiftUI

extension View {
    @ViewBuilder
    func toastGlassEffect() -> some View {
#if os(visionOS)
        glassBackgroundEffect(in: .capsule)
#else
        glassEffect(.regular, in: .capsule)
#endif
    }
}
