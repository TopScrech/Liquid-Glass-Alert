import SwiftUI

public struct ToastRootView<Content: View>: View {
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    @State private var activeToast: Toast?
    @State private var toastDismissTask: Task<Void, Never>?
    
    public var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom) {
                GlassEffectContainer(spacing: ToastMetrics.glassSpacing) {
                    if let activeToast {
                        ToastView(toast: activeToast, dismiss: dismiss)
                    }
                }
                .opacity(activeToast == nil ? 0 : 1)
            }
            .environment(\.showToast, show)
            .environment(\.dismissToast, dismiss)
    }
    
    private func show(_ toast: Toast) {
        withAnimation(animation.logicallyComplete(after: 0.17), completionCriteria: .logicallyComplete) {
            if activeToast != nil {
                activeToast = nil
            }
        } completion: {
            toastDismissTask?.cancel()
            
            withAnimation(animation) {
                activeToast = toast
            }
            
            let duration = max(toast.duration, ToastMetrics.minimumDuration)
            
            toastDismissTask = Task { @MainActor in
                do {
                    try await Task.sleep(for: .seconds(duration))
                    dismiss()
                } catch {
                    
                }
            }
        }
    }
    
    private func dismiss() {
        withAnimation(animation) {
            activeToast = nil
        }
        
        toastDismissTask?.cancel()
        toastDismissTask = nil
    }
    
    private let animation: Animation = .interpolatingSpring(duration: 0.35, bounce: 0, initialVelocity: 0)
}
