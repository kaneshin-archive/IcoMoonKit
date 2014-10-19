// Glyph.swift
//
// Copyright (c) 2014 Shintaro Kaneko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import CoreText

typealias GlyphString = NSMutableAttributedString
extension GlyphString {

    private var range: NSRange {
        return NSMakeRange(0, self.length ?? 0)
    }
    
    private func attributedText() -> NSAttributedString {
        return self.copy() as NSAttributedString
    }
    
    private func attribute(attrName: String) -> AnyObject? {
        return self.attribute(attrName, atIndex: 0, effectiveRange: nil)
    }

    private func addAttribute(name: String, value: AnyObject) {
        self.addAttribute(name, value: value, range: self.range)
    }
    
    private func removeAttribute(name: String) {
        self.removeAttribute(name, range: self.range)
    }
    
}

public class Glyph: NSObject {
    
    private var glyphString: GlyphString?

    public var attributedText: NSAttributedString? {
        return self.glyphString?.attributedText()
    }

    public var code: String? {
        return self.glyphString?.string
    }
    
    public var font: UIFont? {
        return self.glyphString?.attribute(NSFontAttributeName) as? UIFont
    }
    
    public var size: CGFloat {
        return self.font?.pointSize ?? 0
    }

    public var color: UIColor? {
        didSet {
            self.glyphString?.removeAttribute(NSForegroundColorAttributeName)
            self.glyphString?.addAttribute(NSForegroundColorAttributeName, value: self.color!)
        }
    }
    
    public var backgroundColor: UIColor? {
        didSet {
            self.glyphString?.removeAttribute(NSBackgroundColorAttributeName)
            self.glyphString?.addAttribute(NSBackgroundColorAttributeName, value: self.backgroundColor!)
        }
    }
    
    public var image: UIImage {
        return self.image(size: CGSize(width: self.size, height: self.size))
    }
    
    /**
        Designated Initializer
        Creates glyph instance with setting character code, size and color.
    
        :param: code
        :param: size
        :param: color
    */
    public init(code: String, size: CGFloat, color: UIColor) {
        super.init()
        self.setup(font: self.font(size: size), code: code, color: color)
    }

    convenience public init(code: String, size: CGFloat) {
        self.init(code: code, size: size, color: UIColor.blackColor())
    }
    
    /**
        Set attributes for a glyph.
    
        :param: font
        :param: code
        :param: color
    */
    private func setup(#font: UIFont, code: String, color: UIColor) {
        let attributes = [
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: color
        ]
        self.glyphString = NSMutableAttributedString(string: code, attributes: attributes)
    }
    
    private func setup(#font: UIFont, code: String) {
        self.setup(font: font, code: code, color: self.color!)
    }
    
    // MARK: - Sets Glyph Font
    
    public func fontName() -> String {
        assert(false, "ERROR: [\(__FUNCTION__)] => This method must be overridden in subclasse.")
        return ""
    }

    public func fontResource() -> (String, NSBundle?) {
        assert(false, "ERROR: [\(__FUNCTION__)] => This method must be overridden in subclasse.")
        return ("", nil)
    }
    
    private func font(#size: CGFloat) -> UIFont {
        if let font = UIFont(name: self.fontName(), size: size) as UIFont? {
            return font
        }
        var (resource, bundle) = self.fontResource()
        bundle = bundle ?? NSBundle.mainBundle()
        let filename = resource.stringByDeletingPathExtension
        let ext = resource.pathExtension
        let url = bundle!.URLForResource(filename, withExtension: ext)?
        Glyph.registerGraphicsFont(url)
        return font(size: size)
    }
    
    private class func registerGraphicsFont(url: NSURL?) {
        assert(url != nil, "Font file doesn't exist.")
        let fontDataProvider = CGDataProviderCreateWithURL(url)
        let font = CGFontCreateWithDataProvider(fontDataProvider)
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            println(error)
        }
    }

    /**
        Creates an image of the glyph.

        :param: size The size of the image.

        :returns: An image of the glyph.
    */
    public func image(#size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        let glyphSize = self.glyphString!.size()
        let offsetX = 0.5 * (size.width - glyphSize.width)
        let offsetY = 0.5 * (size.height - glyphSize.height)
        let offset = CGPointMake(offsetX, offsetY)
        let rect = CGRect(origin: offset, size: size)
        self.glyphString!.drawInRect(rect)
        var glyphImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return glyphImage
    }
    
}
