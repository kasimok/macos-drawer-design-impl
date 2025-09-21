# Floating Media Player Drawer

A macOS floating window media player control with an animated expandable drawer interface built in SwiftUI.

![Demo](Demo.gif)

## Features

- **Borderless Floating Window**: Custom `NSWindow` with `.floating` level and transparent background
- **Expandable Drawer**: Click the drawer bar to slide out additional settings panel
- **Smooth Animations**: Spring animation with custom damping for natural feel
- **Image-Based UI**: Uses exported Figma assets as placeholder components
- **Retina Optimized**: All dimensions scaled to 1/3 for crisp display

## Architecture

### Components

- **MainInterfaceView**: Primary media control interface (348×102px)
- **DrawerBarView**: Clickable trigger bar (13.33×102px) 
- **DrawerView**: Expandable settings panel (106.67×102px)

### Animation System

Uses `ZStack` with offset-based positioning:
- Drawer group (DrawerView + DrawerBarView) slides horizontally
- MainInterfaceView remains stationary and centered
- Spring animation (`response: 0.35, dampingFraction: 0.85`) for smooth transitions

### Window Configuration

```swift
// Floating window setup
window.styleMask = [.borderless]
window.level = .floating
window.isMovableByWindowBackground = true
window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
```

## Usage

Click the drawer bar on the right edge to expand/collapse the settings panel. The interface maintains its floating behavior and can be moved by dragging anywhere on the window.

## Assets

Requires three image assets exported from Figma:
- `mainInterface` - Main player controls
- `drawerBar` - Vertical trigger bar  
- `drawer` - Settings panel content

---
*Built with SwiftUI and custom NSWindow for macOS*
