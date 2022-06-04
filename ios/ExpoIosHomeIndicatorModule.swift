import ExpoModulesCore

public class ExpoIosHomeIndicatorModule: Module {
  public func definition() -> ModuleDefinition {
    name("ExpoIosHomeIndicator")

    function("helloAsync") { (options: [String: String]) in
      print("Hello 👋")
    }

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
