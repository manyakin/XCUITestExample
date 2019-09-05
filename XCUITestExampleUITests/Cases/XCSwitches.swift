//
//  XCSwitches.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 05/09/2019.
//

import XCTest

class XCSwitches: XCBase {
    
    //Проверка отображения всех элементов формы
    func testViewFeedbackForm() {
        XCHomeTS().openSwitchForm()
        XCSwitchesTS().checkAllElements()
    }
    
    //Проверка работы вкладок
    func testWorkSegmentControl() {
        XCHomeTS().openSwitchForm()
        XCSwitchesTS().checkWorkSegmentControl()
    }
    
    //Проверка отображения значения по умолчанию у переключателя
    func testViewSwitchesBasicValue() {
        XCHomeTS().openSwitchForm()
        XCSwitchesTS().checkSwitchBasicValue()
    }
    
    //Проверка работы переключателя
    func testWorkSwitchesControl() {
        XCHomeTS().openSwitchForm()
        XCSwitchesTS().checkWorkSwitches()
    }
    
    //Проверка работы счетчика
    func testWorkStepperControl() {
        XCHomeTS().openSwitchForm()
        XCSwitchesTS().checkWorStepper()
    }
    
}
