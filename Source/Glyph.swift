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

    class func registerGraphicsFont(url: NSURL) {
        let fontDataProvider = CGDataProviderCreateWithURL(url)
        let font = CGFontCreateWithDataProvider(fontDataProvider)
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
        }
    }
    
    public class func fontName() -> String {
        return ""
    }
    
    public class func resourceName() -> String {
        return ""
    }
    
    private func font(size: CGFloat) -> UIFont! {
        let fontName = self.classForCoder.fontName()
        if let font = UIFont(name: fontName, size: size) as UIFont? {
            return font
        }
        let resourceComponents = self.classForCoder.resourceName().componentsSeparatedByString(".")
        let resource = resourceComponents.first!
        let ext = resourceComponents.last!
        let url = NSBundle.mainBundle().URLForResource(resource, withExtension: ext)!
        self.classForCoder.registerGraphicsFont(url)
        return UIFont(name: fontName, size: size)
    }

    public init(code: String, size: CGFloat) {
        super.init()
        let attributes = [NSFontAttributeName: self.font(size)]
        self.attributedString = NSMutableAttributedString(string: code, attributes: attributes)
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
