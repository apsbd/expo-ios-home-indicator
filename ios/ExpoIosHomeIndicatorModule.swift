import ExpoModulesCore

public class ExpoIosHomeIndicatorModule: Module {
    public func definition() -> ModuleDefinition {
        Name("ExpoIosHomeIndicator")

        AsyncFunction("setBackgroundColorAsync") { (autoHidden: Bool) in
            Self.setBackgroundColorAsync(autoHidden: autoHidden)
        }
    }
  
    static func setBackgroundColorAsync(autoHidden: Bool) {
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
