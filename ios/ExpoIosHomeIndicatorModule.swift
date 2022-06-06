import ExpoModulesCore

public class ExpoIosHomeIndicatorModule: Module {
    public func definition() -> ModuleDefinition {
        Name("ExpoIosHomeIndicator")

        AsyncFunction("setAutoHiddenAsync") { (autoHidden: Bool) in
            Self.setAutoHiddenAsync(autoHidden: autoHidden)
        }
    }
  
    static func setAutoHiddenAsync(autoHidden: Bool) {
        if autoHidden == false {
            return
        }
            
        EXUtilities.performSynchronously {
          if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
          }
        }
    }
}
