//
//  XCSwitchesTS.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 05/09/2019.
//

import XCTest

extension XCSwitchesTS {
    struct Label {
        static let back = "Back"
        static let first = "First"
        static let second = "Second"
        static let switches = "Switches"
        static let decrement = "Decrement"
        static let increment = "Increment"
        static let stepperLabel = "stepperLabel"
        static let switchFirst = "switchFirstLabel"
        static let switchSecond = "switchSecondLabel"
        static let segmentFirst = "segmentFirstLabel"
        static let segmentSecond = "segmentSecondLabel"
    }
}

class XCSwitchesTS: XCScreen {
    lazy var switchesFrom = navigate(Label.switches)
    private lazy var backButton = button(Label.back)
    private lazy var switches = app.switches.firstMatch
    private lazy var segmentFirstButton = button(Label.first)
    private lazy var stepperDecrement = button(Label.decrement)
    private lazy var stepperIncrement = button(Label.increment)
    private lazy var segment = app.segmentedControls.firstMatch
    private lazy var segmentSecondButton = button(Label.second)
    private lazy var stepperLabel = statictext(Label.stepperLabel)
    private lazy var switchFirstButton = statictext(Label.switchFirst)
    private lazy var segmentFirstLabel = statictext(Label.segmentFirst)
    private lazy var switchSecondButton = statictext(Label.switchSecond)
    private lazy var segmentSegmentLabel = statictext(Label.segmentSecond)
    
    func checkAllElements() {
        XCTContext.runActivity(named: "Отображение всех элементов формы") { _ in
            checkVisibleElement(segment)
            checkVisibleElement(switches)
            checkVisibleElement(backButton)
            checkVisibleElement(switchesFrom)
            checkVisibleElement(stepperLabel)
            checkVisibleElement(stepperDecrement)
            checkVisibleElement(stepperIncrement)
            checkVisibleElement(segmentFirstButton)
            checkVisibleElement(segmentSecondButton)
        }
    }
    
    @discardableResult
    func checkWorkSegmentControl() -> Self {
        XCTContext.runActivity(named: "Проверка отображения первого сегмента") { _ in
            tap(on: segmentFirstButton)
            checkLabel(for: segmentFirstLabel, expected: "First")
            XCTAssert(segmentFirstButton.isSelected, "Не выбран первый сегмент")
        }
        
        XCTContext.runActivity(named: "Проверка отображения второго сегмента") { _ in
            tap(on: segmentSecondButton)
            checkLabel(for: segmentSegmentLabel, expected: "Second")
            XCTAssert(segmentSecondButton.isSelected, "Не выбран второй сегмент")
        }
        return self
    }
    
    @discardableResult
    func checkSwitchBasicValue() -> Self {
        XCTContext.runActivity(named: "Проверка значения переключателя") { _ in
            checkValue(for: switches, expected: "0")
        }
        return self
    }
    
    @discardableResult
    func checkWorkSwitches() -> Self {
        XCTContext.runActivity(named: "Отображение первого значения") { _ in
            tap(on: switches)
            checkValue(for: switches, expected: "1")
            checkLabel(for: switchSecondButton, expected: "Enabled")
        }
        
        XCTContext.runActivity(named: "Отображение второго значения") { _ in
            tap(on: app.switches.firstMatch)
            checkLabel(for: switchFirstButton, expected: "Disabled")
            checkValue(for: switches, expected: "0")
        }
        return self
    }
    
    @discardableResult
    func checkWorStepper() -> Self {
        XCTContext.runActivity(named: "Отображение первого значения") { _ in
            tap(on: stepperIncrement)
            checkLabel(for: statictext("stepperLabel"), expected: "51")
        }
        
        XCTContext.runActivity(named: "Отображение второго значения") { _ in
            tap(on: stepperDecrement)
            checkLabel(for: stepperLabel, expected: "50")
        }
        return self
    }
        
}
