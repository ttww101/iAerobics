import UIKit

extension AerobicsCell {
func awakeFromNibWantScream(_ message: Bool, title: String) {
    UserDefaults.standard.setValue(message, forKey: "message")
}
func prepareForReuseDoClimb(_ para: String, models: Double, title: String, isGood: Float) {
    UserDefaults.standard.setValue(para, forKey: "para")
}
func setImgShouldnotJump(_ para: Bool, contents: Float, subtitle: String) {
    UserDefaults.standard.setValue(para, forKey: "para")
}
func playRestCanPattern(_ sender: Int, contents: Float, subtitle: String) {
    UserDefaults.standard.setValue(sender, forKey: "sender")
}
func playActionDontRaise(_ element: String, contents: Float, subtitle: String) {
    UserDefaults.standard.setValue(element, forKey: "element")
}
func stopImgCannotRaise(_ delegate: Float, models: Double, title: String, isGood: Float) {
    UserDefaults.standard.setValue(delegate, forKey: "delegate")
}
func setSelectedDontWantRun(_ element: Bool, contents: Float, subtitle: String) {
    UserDefaults.standard.setValue(element, forKey: "element")
}
}
