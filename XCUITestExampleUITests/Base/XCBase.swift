//
//  XCBase.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 04/09/2019.
//

import XCTest

let app = XCUIApplication()

class XCBase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        takeScreenShot()
        super.tearDown()
    }
    
    func takeScreenShot(name screenshotName: String? = nil) {
        let screenshot = XCUIScreen.main.screenshot()
        let attach = XCTAttachment(screenshot: screenshot, quality: .original)
        attach.name = screenshotName ?? name + "_" + UUID().uuidString
        attach.lifetime = .keepAlways
        add(attach)
    }
    
}
