import SwiftUI

public enum ToastPlacement {
    case top, bottom

    var alignment: Alignment {
        self == .top ? .top : .bottom
    }

    var direction: CGFloat {
        self == .top ? -1 : 1
    }
}
