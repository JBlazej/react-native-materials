import ExpoModulesCore
import SwiftUI

struct MaterialsSwiftUIView: View {
    let material: Material
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(material)
    }
}

class MaterialsView: ExpoView {
    private var hostingController: UIHostingController<MaterialsSwiftUIView>?
    
    private var currentMaterial: Material = .regular {
        didSet {
            updateSwiftUIView()
        }
    }
    
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        loadSwiftUIView()
    }
    
    private func loadSwiftUIView() {
        let view = MaterialsSwiftUIView(material: currentMaterial)
        let hostingController = UIHostingController(rootView: view)
        
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        self.hostingController = hostingController
    }
    
    private func updateSwiftUIView() {
        hostingController?.rootView = MaterialsSwiftUIView(material: currentMaterial)
    }
    
    func setMaterial(_ style: String) {
        self.currentMaterial = materialFromString(style)
    }
    
    private func materialFromString(_ string: String) -> Material {
        switch string.lowercased() {
        case "ultrathin": return .ultraThinMaterial
        case "thin": return .thinMaterial
        case "regular": return .regularMaterial
        case "thick": return .thickMaterial
        case "ultrathick": return .ultraThickMaterial
        default: return .regularMaterial
        }
    }
}

