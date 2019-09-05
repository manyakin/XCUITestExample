//
//  XCElements.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 04/09/2019.
//

import XCTest

class XCElements {

    func image(_ element: String) -> XCUIElement {
        return app.images[element].firstMatch
    }
    
    func alert(_ element: String) -> XCUIElement {
        return app.alerts[element].firstMatch
    }
    
    func button(_ element: String) -> XCUIElement {
        return app.buttons[element].firstMatch
    }
    
    func password(_ element: String) -> XCUIElement {
        return app.secureTextFields[element].firstMatch
    }
    
    func navigate(_ element: String) -> XCUIElement {
        return app.navigationBars[element].firstMatch
    }
    
    func textfield(_ element: String) -> XCUIElement {
        return app.textFields[element].firstMatch
    }
    
    func statictext(_ element : String) -> XCUIElement {
        return app.staticTexts[element].firstMatch
    }
    
}
