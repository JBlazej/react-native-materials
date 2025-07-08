import ExpoModulesCore
import SwiftUI

struct MaterialSwiftUIView: View {
    let material: Material
    let forcedColorScheme: ColorScheme?
    
    var body: some View {
        Color.clear
            .background(material)
            .applyIf(forcedColorScheme != nil) { view in
                view.environment(\.colorScheme, forcedColorScheme!)
            }
    }
}

class MaterialView: ExpoView {
    private var hostingController: UIHostingController<MaterialSwiftUIView>?
    
    private var currentMaterial: Material = .regular {
        didSet {
            updateSwiftUIView()
        }
    }
    
    private var currentColorScheme: ColorScheme? = nil {
        didSet { updateSwiftUIView() }
    }
    
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        loadSwiftUIView()
    }
    
    private func loadSwiftUIView() {
        let view = MaterialSwiftUIView(
            material: currentMaterial,
            forcedColorScheme: currentColorScheme
        )
        
        let hostingController = UIHostingController(rootView: view)
        
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: topAnchor),
            hostingController.view.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            hostingController.view.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            hostingController.view.trailingAnchor.constraint(
                equalTo: trailingAnchor),
        ])
        
        self.hostingController = hostingController
    }
    
    private func updateSwiftUIView() {
        hostingController?.rootView = MaterialSwiftUIView(
            material: currentMaterial,
            forcedColorScheme: currentColorScheme
        )
    }
    
    func setMaterial(_ style: String) {
        self.currentMaterial = materialFromString(style)
    }
    
    func setColorScheme(_ scheme: String?) {
        guard let scheme = scheme?.lowercased() else {
            currentColorScheme = nil
            return
        }
        
        switch scheme {
        case "light": currentColorScheme = .light
        case "dark": currentColorScheme = .dark
        default: currentColorScheme = nil
        }
    }
    
    private func materialFromString(_ string: String) -> Material {
        switch string.lowercased() {
        case "ultra-thin": return .ultraThinMaterial
        case "thin": return .thinMaterial
        case "regular": return .regularMaterial
        case "thick": return .thickMaterial
        case "ultra-thick": return .ultraThickMaterial
        default: return .regularMaterial
        }
    }
}

extension View {
    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, transform: (Self) -> T)
    -> some View
    {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
