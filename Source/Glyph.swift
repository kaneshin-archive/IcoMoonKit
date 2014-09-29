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

public class Glyph: NSObject {
    
    var attributedString: NSMutableAttributedString?

    class func registerGraphicsFont(url: NSURL?) {
        assert(url != nil, "There is no a font to register.")
        let fontDataProvider = CGDataProviderCreateWithURL(url)
        let font = CGFontCreateWithDataProvider(fontDataProvider)
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            println(error)
        }
    }
    
    public init(code: String, size: CGFloat) {
        super.init()
        let attributes = [NSFontAttributeName: self.font(size)]
        self.attributedString = NSMutableAttributedString(string: code, attributes: attributes)
    }
    
    // MARK: - Sets Font (Glyphs)
    
    public func fontName() -> String {
        assert(false, "ERROR: [\(__FUNCTION__)] => This method must be overridden in subclasse.")
        return ""
    }
    
    
    public func fontResource() -> (String, NSBundle?) {
        assert(false, "ERROR: [\(__FUNCTION__)] => This method must be overridden in subclasse.")
        return ("", nil)
    }
    
    private func font(size: CGFloat) -> UIFont {
        if let font = UIFont(name: self.fontName(), size: size) as UIFont? {
            return font
        }
        var (resource, bundle) = self.fontResource()
        bundle = bundle ?? NSBundle.mainBundle()
        let filename = resource.stringByDeletingPathExtension
        let ext = resource.pathExtension
        let url = bundle!.URLForResource(filename, withExtension: ext)?
        Glyph.registerGraphicsFont(url)
        return font(size)
    }

    // MARK: - Draw Image
    
    public func image(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        let context = UIGraphicsGetCurrentContext()
        
        let glyphSize = self.attributedString!.size()
        let offsetX = 0.5 * (size.width - glyphSize.width)
        let offsetY = 0.5 * (size.height - glyphSize.height)
        let offset = CGPointMake(offsetX, offsetY)
        let rect = CGRect(origin: offset, size: size)

        self.attributedString!.drawInRect(rect)
        var glyphImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return glyphImage
    }
    
}
