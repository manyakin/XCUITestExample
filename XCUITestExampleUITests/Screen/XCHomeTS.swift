//
//  XCHomeTS.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 04/09/2019.
//

import XCTest

extension XCHomeTS {
    struct Label {
        static let login = "loginButton"
        static let switches = "switchButton"
        static let feedback = "feedbackButton"
    }
}

class XCHomeTS: XCScreen {
    private lazy var loginButton = button(Label.login)
    private lazy var switchButton = button(Label.switches)
    private lazy var feedbackButton = button(Label.feedback)
    
    func openLoginForm() {
        XCTContext.runActivity(named: "Переход на форму входа") { _ in
            tap(on: loginButton)
            waitElement(expect: XCLoginTS().loginForm, time: 5)
        }
    }
    
    func openFeedbackForm() {
        XCTContext.runActivity(named: "Переход на форму обратной связи") { _ in
            tap(on: feedbackButton)
            waitElement(expect: XCFeedbackTS().feedbackForm, time: 5)
        }
    }
    
    func openSwitchForm() {
        XCTContext.runActivity(named: "Переход на форму переключателей") { _ in
            tap(on: switchButton)
            waitElement(expect: XCSwitchesTS().switchesFrom, time: 5)
        }
    }
    
}
