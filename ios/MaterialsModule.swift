import ExpoModulesCore

public class MaterialsModule: Module {
  public func definition() -> ModuleDefinition {
    Name("Materials")

    View(MaterialsView.self) {
      Prop("material") { (view: MaterialsView, material: String) in
        view.setMaterial(material)
      }
    }
  }
}