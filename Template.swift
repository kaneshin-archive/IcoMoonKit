import Foundation
import IcoMoonKit

public class FeatherGlyph: Glyph {

    // MARK: - Initialize

    convenience init(type: Type, size: CGFloat, color: UIColor) {
        self.init(code: type.rawValue, size: size, color: color)
    }

    // MARK: - Font

    override public func fontName() -> String {
        return "#__FONT_NAME__#"
    }

    override public func fontResource() -> (String, NSBundle) {
        return ("#__FONT_FILE__#", NSBundle.mainBundle())
    }

    // MARK: -

    enum Type: String {
    }

    // MARK: -

    #__GLYPH_CLASS__#
}
