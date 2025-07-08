import ExpoModulesCore
import UIKit

class MaterialsView: ExpoView {
  private let materialBackground = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

  required init(appContext: AppContext? = nil) {
    super.init(appContext: appContext)
    clipsToBounds = true
    addSubview(materialBackground)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    materialBackground.frame = bounds
  }

  func setMaterialStyle(_ style: String) {
    let blurStyle = blurEffectStyle(from: style)
    materialBackground.effect = UIBlurEffect(style: blurStyle)
  }

  private func blurEffectStyle(from string: String) -> UIBlurEffect.Style {
    switch string.lowercased() {
    case "extralight": return .extraLight
    case "light": return .light
    case "dark": return .dark
    case "regular": return .regular
    case "prominent": return .prominent
    case "systemultrathinmaterial": return .systemUltraThinMaterial
    case "systemthinmaterial": return .systemThinMaterial
    case "systemmaterial": return .systemMaterial
    case "systemthickmaterial": return .systemThickMaterial
    case "systemchromematerial": return .systemChromeMaterial
    default: return .dark
    }
  }
}
