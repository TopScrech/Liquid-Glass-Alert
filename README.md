# Liquid Glass Alert

A SwiftUI package for showing Liquid Glass toast alerts

## Install

Add this package in Xcode, then import the library module

```swift
import LGAlert
```

## Usage

Wrap the root view that should be able to present toasts

```swift
import SwiftUI
import LGAlert

struct ContentView: View {
	var body: some View {
		NavigationStack {
			ForYouView()
		}
		.toastRoot()
	}
}
```

Show and dismiss toasts from the environment

```swift
struct ForYouView: View {
	@Environment(\.showToast) private var showToast
	@Environment(\.dismissToast) private var dismissToast

	var body: some View {
		VStack {
			Button("Add to Cart", systemImage: "cart.fill") {
				showToast(.init(
					title: "Added to Cart",
					duration: 3,
					placementOffset: -60,
					symbol: "cart.fill",
					actionTitle: "Undo"
				) {
					true
				})
			}

			Button("Dismiss", systemImage: "xmark", action: dismissToast)
		}
	}
}
```
