import UIKit

struct Const {
    static let tabBarTitles = ["","",""]
    static let tabBarImages = ["tasksTabBarIcon","nill","profileTabBarIcon"]
    static let avatarMaxSize: Double = 30.0
}

enum FontName {
    static let ultraLight = "e-Ukraine-UltraLight"
    static let light = "e-Ukraine-Light"
    static let regular = "e-Ukraine-Regular"
    static let medium = "e-Ukraine-Medium"
}

enum AppColor {
    static let accentMagenta = UIColor(red: 216/255, green: 50/255, blue: 83/255, alpha: 1)
    static let backgroundDefault = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
    static let backgroundPrimary = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
    static let backgroundSecondary = UIColor(red: 45/255, green: 45/255, blue: 46/255, alpha: 1)
    static let backgroundQuaternary: UIColor = UIColor(red: 72/255, green: 72/255, blue: 74/255, alpha: 1)
    static let textWhite: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let textPrimary: UIColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
}

enum ImageName {
    static let logo = "logo"
    static let addPhoto = "addPhotoImage"
    static let loadErrorImage = "LoadErrorImage"
}
