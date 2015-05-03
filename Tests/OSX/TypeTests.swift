// TypeTests.swift
//
// Copyright (c) 2014-2015 Shintaro Kaneko
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

import Foundation
import AppKit
import XCTest
import IcoMoonKit

class TypeTests: XCTestCase {

    var obj: AnyObject?

    override func tearDown() {
        obj = nil
        super.tearDown()
    }

    func testImageType() {
        obj = Image()
        XCTAssertTrue(obj is NSImage, "Image should be NSImage")
    }

    func testColorType() {
        obj = Color()
        XCTAssert(obj is NSColor, "Color should be NSColor")
        let color: Color = Color(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)

        let alpha = CGColorGetAlpha(color.CGColor)
        XCTAssertEqual(alpha, 0.4, "Alpha should be initialized")
    }

    func testFontType() {
        obj = Font()
        XCTAssertTrue(obj is NSFont, "Font should be NSFont")
    }
    
}
