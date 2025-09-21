import SwiftUI
import AppKit

class FloatingWindowController: NSWindowController {
    
    convenience init() {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 294, height: 102),
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        
        self.init(window: window)
        
        setupWindow()
    }
    
    private func setupWindow() {
        guard let window = window else { return }
        
        // Remove window decorations for floating style
        window.styleMask = [.borderless]
        window.backgroundColor = NSColor.clear
        window.isOpaque = false
        window.hasShadow = true
        window.level = .floating
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        
        // Center the window
        window.center()
        
        // Make it movable by dragging anywhere
        window.isMovableByWindowBackground = true
        
        // Set the content view
        let contentView = NSHostingView(rootView: ContentView())
        contentView.wantsLayer = true
        contentView.layer?.isOpaque = false
        contentView.layer?.backgroundColor = NSColor.clear.cgColor
        window.contentView = contentView
    }
}
