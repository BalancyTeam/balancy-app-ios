import UIKit

struct Const {
    static let tabBarTitles = ["","",""]
    static let tabBarImages = ["tasksTabBarIcon","nill","profileTabBarIcon"]
    static let avatarMaxSize: Double = 30.0
}

enum FontName {
    static let light = "e-Ukraine-Light"
    static let regular = "e-Ukraine-Regular"
    static let medium = "e-Ukraine-Medium"
}

enum AppColor {
    static let background = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
    static let button = UIColor(red: 0.85, green: 0.2, blue: 0.33, alpha: 1)
    static let pageIndicatorTintColor = UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1)
    static let containerBack: UIColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
    static let buttonBorder: UIColor = UIColor(red: 0.282, green: 0.282, blue: 0.29, alpha: 1)
    static let buttonText: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
    
    //Main Screen Colors
    static let tabBarSelected: UIColor = UIColor(named: "TabBarSelected") ?? .white
    static let tabBarDeselected: UIColor = UIColor(named: "TabBarDeselected") ?? .black
    static let secondaryText: UIColor = UIColor(named: "SecondaryText") ?? .white
    static let primaryText: UIColor = UIColor(named: "PrimaryText") ?? .white
}

enum ImageName {
    static let logo = "logo"
    static let addPhoto = "addPhotoImage"
    static let loadErrorImage = "LoadErrorImage"
    //Main Screen icons
    static let addButton = "Add"
    static let profile = "Profile"
    static let tasks = "Tasks"
    static let searchImage = "search"
}
