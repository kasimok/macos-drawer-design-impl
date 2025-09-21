import SwiftUI

struct ContentView: View {
    @State private var isDrawerExpanded = false
    private let mainWidth: CGFloat = 348 /*< 3.0 scale of the image asset*/
    private let drawerWidth: CGFloat = 106.67
    private let barWidth: CGFloat = 13.33
    private let panelHeight: CGFloat = 102
    
    /// offset of the HStack to make only  shows `drawerBarView`
    private let initialOffset: CGFloat = 125

    var body: some View {
        ZStack {
           
            // Drawer group = Drawer + Bar (this group slides)
            HStack(spacing: 0) {
                DrawerView()
                    .frame(width: drawerWidth, height: panelHeight)
                DrawerBarView(isDrawerExpanded: $isDrawerExpanded)
                    .frame(width: barWidth, height: panelHeight)
            }.offset(x: isDrawerExpanded ? initialOffset + drawerWidth : initialOffset)
            
            
            // Main Interface (never moves)
            MainInterfaceView()
                .frame(width: mainWidth, height: panelHeight)
            
            
        }
        .frame(width: mainWidth + drawerWidth + barWidth + mainWidth / 2, height: panelHeight) /* + `mainWidth / 2` as MainInterfaceView is centerred in parent container, otherwise the view will be clipped */
        .animation(.spring(response: 0.35, dampingFraction: 0.85), value: isDrawerExpanded)
    }
}


/// Main interface with mocked up image
/// - NOTE: internal controls not implemented
struct MainInterfaceView: View {
    var body: some View {
        Image("mainInterface")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct DrawerBarView: View {
    @Binding var isDrawerExpanded: Bool

    var body: some View {
        Image("drawerBar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .onTapGesture { isDrawerExpanded.toggle() }
    }
}

/// Drawer interface with mocked up image
/// - NOTE: internal controls not implemented
struct DrawerView: View {
    var body: some View {
        Image("drawer")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
