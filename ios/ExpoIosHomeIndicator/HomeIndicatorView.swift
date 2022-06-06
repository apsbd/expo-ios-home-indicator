import UIKit
import ExpoModulesCore

public class ExpoIosHomeIndicatorView: ExpoView {
    private var prefersAutoHidden: Bool

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }

    public func setPrefersAutoHidden(_ autoHidden: Bool) {
        prefersAutoHidden = autoHidden
    }
}
