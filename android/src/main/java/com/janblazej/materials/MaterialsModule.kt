package com.janblazej.materials

import expo.modules.kotlin.modules.Module
import expo.modules.kotlin.modules.ModuleDefinition

class MaterialsModule : Module() {
  override fun definition() = ModuleDefinition {
    Name("Materials")

    View(MaterialView::class) {
      Prop("material") { view: MaterialView, material: String ->
        view.setMaterial(material)
      }

      Prop("variant") { view: MaterialView, variant: String? ->
        view.setVariant(variant)
      }
    }
  }
}
