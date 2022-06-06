import ExpoModulesCore

public class ExpoIosHomeIndicatorModule: Module {
  public func definition() -> ModuleDefinition {
    name("ExpoIosHomeIndicator")

    viewManager {
      view {
        ExpoIosHomeIndicatorView()
      }

      prop("name") { (view: ExpoIosHomeIndicatorView, prop: String) in
        print(prop)
      }
    }
  }
}
