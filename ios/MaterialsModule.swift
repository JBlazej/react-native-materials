import ExpoModulesCore

public class MaterialsModule: Module {
    public func definition() -> ModuleDefinition {
        Name("Materials")
        
        View(MaterialView.self) {
            Prop("material") { (view: MaterialView, material: String) in
                view.setMaterial(material)
            }
            
            Prop("variant") { (view: MaterialView, variant: String?) in
                view.setColorScheme(variant)
            }
        }
    }
}
