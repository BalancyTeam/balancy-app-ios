import UIKit
import SwiftUI

final class RoundedButtonView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
}

extension RoundedButtonView {
    convenience init(_ type: ButtonType = .system, text: String = "", textColor: UIColor = AppColor.textWhite) {
        self.init(type: type)
        self.setupButton()
        self.setTitle(text, textColor: textColor)
    }
    
    convenience init(_ type: ButtonType = .system) {
        self.init(type: type)
        self.setupButton()
    }
    
    func setTitle(_ text: String = "", textColor: UIColor = AppColor.textWhite) {
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
    }
    
    func setupBorder(width: CGFloat, color: UIColor = .clear) {
        layer.borderWidth = 2
        layer.borderColor = color.cgColor
    }
}

private extension RoundedButtonView {
    private func setupButton() {
        titleLabel?.font = UIFont(name: "e-Ukraine-Medium", size: 16)
        setCornerRadius(20)
        clipsToBounds = true
    }
}

#Preview {
    let button = RoundedButtonView(text: Localized.addOther.localizedString)
    button.backgroundColor = AppColor.accentMagenta
    button.setupBorder(width: 2, color: AppColor.textWhite)
    
    return button.preview
        .padding(.horizontal, 24)
        .frame(height: 50)
}
