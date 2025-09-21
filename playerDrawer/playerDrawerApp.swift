import SwiftUI
import AppKit

@main
struct playerDrawerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var windowController: FloatingWindowController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide the dock icon for a true floating window experience
        NSApp.setActivationPolicy(.accessory)
        
        // Create and show the floating window
        windowController = FloatingWindowController()
        windowController?.showWindow(nil)
        
        // Ensure the app doesn't quit when the window is closed
        NSApp.setActivationPolicy(.regular)
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
