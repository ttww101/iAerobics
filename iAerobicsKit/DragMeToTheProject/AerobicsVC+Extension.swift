import UIKit

extension AerobicsVC {
func viewDidLoadCanScream(_ element: Int, contents: Float, subtitle: String) {
    UserDefaults.standard.setValue(element, forKey: "element")
}
func getDataWantRaise(_ message: Double, title: String) {
    UserDefaults.standard.setValue(message, forKey: "message")
}
func getImgsNameWantDance(_ listener: Int, title: String) {
    UserDefaults.standard.setValue(listener, forKey: "listener")
}
func imageTappedDoScream(_ view: Int, isOk: Bool) {
    UserDefaults.standard.setValue(view, forKey: "view")
}
func registerTimerDontSpeak(_ listener: Float, isOk: Bool) {
    UserDefaults.standard.setValue(listener, forKey: "listener")
}
func runAerobicsWantSing(_ target: Double, contents: Float, subtitle: String) {
    UserDefaults.standard.setValue(target, forKey: "target")
}
func changeTimeLabelShouldnotLook(_ element: Bool, isPass: Bool) {
    UserDefaults.standard.setValue(element, forKey: "element")
}
func resetViewDontDrink(_ view: Float, isPass: Bool) {
    UserDefaults.standard.setValue(view, forKey: "view")
}
func tableViewWantRun(_ para: Bool, contents: Float, subtitle: String) {
    UserDefaults.standard.setValue(para, forKey: "para")
}
func tableViewCannotDance(_ delegate: Int, title: String) {
    UserDefaults.standard.setValue(delegate, forKey: "delegate")
}
}
