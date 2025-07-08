package com.janblazej.materials

import android.content.Context
import android.graphics.RenderEffect
import android.graphics.Shader
import android.os.Build
import android.view.View
import android.view.ViewGroup.LayoutParams.MATCH_PARENT
import android.widget.FrameLayout
import expo.modules.kotlin.AppContext
import expo.modules.kotlin.views.ExpoView

class MaterialView(context: Context, appContext: AppContext) : ExpoView(context, appContext) {
  private val backgroundView = View(context).apply {
    layoutParams = FrameLayout.LayoutParams(MATCH_PARENT, MATCH_PARENT)
  }

  private var currentMaterial: String? = null

  init {
    addView(backgroundView)
  }

  fun setMaterial(material: String?) {
    currentMaterial = material

    val blur: Float
    val color: Int

    when (material?.lowercase()) {
      "ultra-thin" -> {
        blur = 5f; color = 0x22FFFFFF.toInt()
      }
      "thin" -> {
        blur = 10f; color = 0x33FFFFFF.toInt()
      }
      "regular" -> {
        blur = 20f; color = 0x44FFFFFF.toInt()
      }
      "thick" -> {
        blur = 30f; color = 0x66FFFFFF.toInt()
      }
      "ultra-thick" -> {
        blur = 40f; color = 0x88FFFFFF.toInt()
      }
      else -> {
        blur = 20f; color = 0x44FFFFFF.toInt()
      }
    }

    applyMaterial(blur, color)
  }

  fun applyMaterial(blurRadius: Float, color: Int) {
    backgroundView.setBackgroundColor(color)

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
      backgroundView.setRenderEffect(
        RenderEffect.createBlurEffect(
          blurRadius, blurRadius, Shader.TileMode.CLAMP
        )
      )
    }
  }

  fun setVariant(variant: String?) {
    if (variant?.lowercase() == "dark") {
      val overlayColor: Int = when (currentMaterial?.lowercase()) {
        "ultra-thin"  -> 0x22000000.toInt()
        "thin"        -> 0x33000000.toInt()
        "regular"     -> 0x44000000.toInt()
        "thick"       -> 0x55000000.toInt()
        "ultra-thick" -> 0x66000000.toInt()
        else          -> 0x44000000.toInt()
      }
      backgroundView.setBackgroundColor(overlayColor)
    } else {
      // light or undefined: reset to material-defined blur and tint
      setMaterial(currentMaterial)
    }
  }
}