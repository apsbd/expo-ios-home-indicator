import UIKit
import ExpoModulesCore

@objc(ExpoIosHomeIndicatorView)
public class ExpoIosHomeIndicatorView: ExpoView {
    private var prefersAutoHidden: Bool

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setNeedsUpdateOfHomeIndicatorAutoHidden()
    }


    @objc
    public func setPrefersAutoHidden(_ autoHidden: Bool) {
        prefersAutoHidden = autoHidden
    }
}
