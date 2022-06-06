import UIKit

public class ExpoIosHomeIndicatorView: UIView {
    private var prefersAutoHidden: Bool

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }

    public func setPrefersAutoHidden(_ autoHidden: Bool) {
        prefersAutoHidden = autoHidden
    }
}
