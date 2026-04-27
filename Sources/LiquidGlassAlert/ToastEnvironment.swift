import SwiftUI

public extension EnvironmentValues {
	@Entry var showToast: @MainActor (Toast) -> Void = { _ in }
	@Entry var dismissToast: @MainActor () -> Void = { }
}
