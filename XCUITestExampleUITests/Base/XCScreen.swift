//
//  XCScreen.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 04/09/2019.
//

import XCTest

class XCScreen: XCElements {
    
    func type(text: String, in element: XCUIElement) {
        XCTContext.runActivity(named: "Заполнение поля \(element)") { _ in
            element.tap()
            element.typeText(text)
        }
    }
 
    func checkValue(for element: XCUIElement, expected result: String) {
        XCTContext.runActivity(named: "Сравнение введенного текста в поле") { _ in
            let text = element.value as? String ?? ""
            XCTAssert(text == result, "Не совпадает текст в поле \(element)")
        }
    }
    
    func checkHideElement(_ element: XCUIElement) {
        XCTContext.runActivity(named: "Проверка скрытия элемента - \(element)") { _ in
            XCTAssertFalse(element.exists, "Не скрыт элемент \(element)")
        }
    }
    
    func checkLabel(for element: XCUIElement, expected result: String) {
        XCTContext.runActivity(named: "Проверка отображения значения элемента") { _ in
            let label = element.label
            XCTAssert(label == result, "Не совпадает значение элемента \(element)")
        }
    }
    
    func waitElement(expect element: XCUIElement, time: Int) {
        _ = XCTContext.runActivity(named: "Ожидание появления элемента \(element)") { _ in
            element.waitForExistence(timeout: TimeInterval(time))
        }
    }
    
    func checkVisibleElement(_ element: XCUIElement) {
        XCTContext.runActivity(named: "Проверка отображения элемента - \(element)") { _ in
            XCTAssert(element.exists, "Не отображен элемент \(element)")
        }
    }
    func checkPlaceholder(for element: XCUIElement, expected result: String) {
        XCTContext.runActivity(named: "Проверка отображения плейсхолдера элемента") { _ in
            let holder = element.placeholderValue
            XCTAssert(holder == result, "Не совпадает плейсхолдер у элемента \(element)")
        }
    }
    
    func tap(on element: XCUIElement) {
        XCTContext.runActivity(named: "Тап по элементу \(element)") { _ in
            if element.isHittable {
                element.tap()
            }
            else {
                let coordinate: XCUICoordinate = element.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
                coordinate.tap()
            }
        }
    }
    
}
