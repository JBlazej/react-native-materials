import ExpoModulesCore

public class MaterialsModule: Module {
  public func definition() -> ModuleDefinition {
    Name("Materials")

    View(MaterialsView.self) {
      Prop("materialStyle") { (view: MaterialsView, materialStyle: String) in
        view.setMaterialStyle(materialStyle)
      }
    }
  }
}