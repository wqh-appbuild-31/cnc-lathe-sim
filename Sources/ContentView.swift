import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView()
            .ignoresSafeArea()
            .background(Color(red: 10.0 / 255.0, green: 14.0 / 255.0, blue: 17.0 / 255.0))
    }
}

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let webView = WKWebView(frame: .zero, configuration: config)
        let bg = UIColor(red: 10.0 / 255.0, green: 14.0 / 255.0, blue: 17.0 / 255.0, alpha: 1.0)
        webView.backgroundColor = bg
        webView.scrollView.backgroundColor = bg
        webView.isOpaque = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never

        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            // Allow the page to read its sibling files (three.min.js / OrbitControls.js)
            // from the app bundle directory.
            webView.loadFileURL(url, allowingReadAccessTo: Bundle.main.bundleURL)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
