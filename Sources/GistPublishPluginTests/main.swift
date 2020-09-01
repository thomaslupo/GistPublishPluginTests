import Foundation
import Publish
import Plot
import GistPublishPlugin
import Splash

// This type acts as the configuration for your website.
struct GistPublishPluginTests: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "GistPublishPluginTests"
    var description = "A description of GistPublishPluginTests"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

class MyGistRenderer: GistRenderer {
    func render(gist: EmbeddedGist) throws -> String {
        let highlighter = SyntaxHighlighter(format: HTMLOutputFormat())
        return gist.files.map { file in
            return "<pre><code>" + highlighter.highlight(file.content) + "</pre></code>"
        }.joined(separator: "")
    }
}

// This will generate your website using the built-in Foundation theme:
try GistPublishPluginTests().publish(withTheme: .myTheme,
                                     plugins: [.gist(renderer: MyGistRenderer())])
