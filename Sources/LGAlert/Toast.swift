import SwiftUI

public struct Toast: Identifiable {
    public let id: UUID
    public var title: String
    public var duration: TimeInterval
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
        placementOffset: CGFloat = -60,
        transitionOffset: CGFloat = 100,
        symbol: String? = nil,
        actionTitle: String? = nil,
        actionTint: Color = .accentColor,
        action: (@MainActor () -> Bool)? = nil
    ) {
        self.id = id
        self.title = title
        self.duration = duration
        self.placementOffset = placementOffset
        self.transitionOffset = transitionOffset
        self.symbol = symbol
        self.actionTitle = actionTitle
        self.actionTint = actionTint
        self.action = action
    }
}
