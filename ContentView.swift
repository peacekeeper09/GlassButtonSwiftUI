import SwiftUI

struct GlassButton: View {
    var label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .foregroundColor(Color.white)
                .padding()
                .background(BlurView(style: .systemThinMaterial))
                .cornerRadius(10)
                .opacity(0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
        }
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    }
}

struct GlassButtonDemo: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.blue, Color.pink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .overlay(
            VStack {
                GlassButton(label: "Glass Button") {
                    // Action to perform when the button is tapped
                }
            }
        )
    }
}

@main
struct GlassButtonApp: App {
    var body: some Scene {
        WindowGroup {
            GlassButtonDemo()
        }
    }
}
