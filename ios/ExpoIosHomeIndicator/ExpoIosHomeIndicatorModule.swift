import ExpoModulesCore

public class ExpoIosHomeIndicatorModule: Module {
  public func definition() -> ModuleDefinition {
    name("ExpoIosHomeIndicator")
      
    viewManager {
      view {
        ExpoIosHomeIndicatorView()
      }

      prop("prefersAutoHidden") { (view: ExpoIosHomeIndicatorView, prop: Bool) in
        print(prop)
      }
    }
  }
}

