import ExpoModulesCore

public class ExpoIosHomeIndicatorModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoIosHomeIndicator")

    ViewManager {
      View {
        ExpoIosHomeIndicatorView()
      }

      Prop("autoHidden") { (view: ExpoIosHomeIndicatorView, prop: Bool) in
        print(prop)
      }
    }
  }
}
