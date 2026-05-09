import SwiftUI

struct ToastView: View {
    let toast: Toast
    let dismiss: @MainActor () -> Void
    
    var body: some View {
        HStack(spacing: ToastMetrics.contentSpacing) {
            if let symbol = toast.symbol {
                Image(systemName: symbol)
                    .font(.title3)
                    .foregroundStyle(.primary)
                    .transition(.identity)
            }
            
            Text(toast.title)
                .font(.body)
                .lineLimit(1)
            
            Spacer(minLength: 0)
            
            if let actionTitle = toast.actionTitle, let action = toast.action {
                Button(actionTitle, action: {
                    if action() {
                        dismiss()
                    }
                })
                .foregroundStyle(toast.actionTint)
                .transition(.identity)
            }
        }
        .padding(.horizontal, ToastMetrics.horizontalPadding)
        .frame(height: ToastMetrics.height)
        .clipShape(.capsule)
        .contentShape(.capsule)
        .toastGlassEffect()
        .padding(.horizontal, ToastMetrics.edgePadding)
        .offset(y: toast.placementOffset)
        .gesture(
            DragGesture()
                .onEnded {
                    if $0.translation.height > ToastMetrics.dismissTranslation {
                        dismiss()
                    }
                }
        )
        .transition(.offset(y: toast.transitionOffset))
    }
}
