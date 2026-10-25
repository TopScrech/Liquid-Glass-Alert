import SwiftUI

public struct Toast: Identifiable {
    public let id: UUID
    public var title: String
    public var duration: TimeInterval
    public var placement: ToastPlacement
    public var placementOffset: CGFloat
    public var transitionOffset: CGFloat
    public var symbol: String?
    public var actionTitle: String?
    public var actionTint: Color
    public var action: (@MainActor () -> Bool)?
    
    public init(
        id: UUID = UUID(),
        title: String,
        duration: TimeInterval = 3,
        placement: ToastPlacement = .bottom,
        placementOffset: CGFloat? = nil,
        transitionOffset: CGFloat = 100,
        symbol: String? = nil,
        actionTitle: String? = nil,
        actionTint: Color = .accentColor,
        action: (@MainActor () -> Bool)? = nil
    ) {
        self.id = id
        self.title = title
        self.duration = duration
        self.placement = placement
        self.placementOffset = placementOffset ?? (-60 * placement.direction)
        self.transitionOffset = transitionOffset
        self.symbol = symbol
        self.actionTitle = actionTitle
        self.actionTint = actionTint
        self.action = action
    }
}
