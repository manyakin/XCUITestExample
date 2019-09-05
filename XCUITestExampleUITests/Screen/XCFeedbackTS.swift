//
//  XCFeedbackTS.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 05/09/2019.
//

import XCTest

extension XCFeedbackTS {
    struct Label {
        static let accept = "OK"
        static let back = "Back"
        static let save = "save"
        static let mail = "mailField"
        static let from = "fromField"
        static let phone = "phoneField"
        static let feedback = "Feedback"
        static let message = "messageField"
        static let success = "Your message has been sent"
    }
    
    enum Data: String {
        case city = "Омск"
        case lessTwoSymbol = "1"
        case message = "Message"
        case phone = "9609949494"
        case lessThreeSymbol = "hi"
        case mail = "test@test.com"
        case errorMail = "test@test"
        case errorPhone = "96099454"
    }

    struct Validate {
        static let emptyMessage = "Please, enter message"
        static let emptyFrom = "Please, enter from field"
        static let emptyPhone = "Please, enter phone number"
        static let emptyEmail = "Please, enter email address"
    }
    
    enum Error: String {
        case invalidPhone = "Invalid phone number"
        case invalidEmail = "Invalid email address"
        case invalidFrom = "Please, enter 2 or more characters"
        case invalidMessage = "Please, enter 3 or more characters"
    }
}

class XCFeedbackTS: XCScreen {
    lazy var feedbackForm = navigate(Label.feedback)
    private lazy var saveButton = button(Label.save)
    private lazy var backButton = button(Label.back)
    private lazy var mailField = textfield(Label.mail)
    private lazy var fromField = textfield(Label.from)
    private lazy var phoneField = textfield(Label.phone)
    private lazy var feedbackAlert = app.alerts.firstMatch
    private lazy var messageField = textfield(Label.message)
    private lazy var feedbackAlertButton = button(Label.accept)
    private lazy var feedbackTable = app.otherElements.firstMatch
    private lazy var feedbackAlertText = statictext(Label.success)
    
    func checkAllElements() {
        XCTContext.runActivity(named: "Отображение всех элементов формы") { _ in
            checkVisibleElement(mailField)
            checkVisibleElement(fromField)
            checkVisibleElement(backButton)
            checkVisibleElement(phoneField)
            checkVisibleElement(saveButton)
            checkVisibleElement(feedbackForm)
            checkVisibleElement(messageField)
        }
    }
    
    func checkValueElements() {
        XCTContext.runActivity(named: "Проверка текста элементов формы") { _ in
            checkPlaceholder(for: fromField, expected: "From *")
            checkLabel(for: saveButton, expected: "Send Message")
            checkPlaceholder(for: mailField, expected: "Email *")
            checkPlaceholder(for: phoneField, expected: "Phone *")
            checkPlaceholder(for: messageField, expected: "Message *")
        }
    }
    
    @discardableResult
    func saveForm() -> Self {
        XCTContext.runActivity(named: "Сохранение формы") { _ in
            tap(on: feedbackTable)
            tap(on: saveButton)
        }
        return self
    }
    
    @discardableResult
    func checkValidateError(error: Error) -> Self {
        XCTContext.runActivity(named: "Проверка отображения ошибки валидации") { _ in
            checkVisibleElement(statictext(error.rawValue))
        }
        return self
    }
    
    @discardableResult
    func fillMessage(value: Data) -> Self {
        XCTContext.runActivity(named: "Заполнение поля - Сообщение") { _ in
            type(text: value.rawValue, in: messageField)
        }
        return self
    }
    
    @discardableResult
    func fillPhone(value: Data) -> Self {
        XCTContext.runActivity(named: "Заполнение поля - Телефон") { _ in
            type(text: value.rawValue, in: phoneField)
        }
        return self
    }
    
    @discardableResult
    func fillFrom(value: Data) -> Self {
        XCTContext.runActivity(named: "Заполнение поля - Откуда") { _ in
            type(text: value.rawValue, in: fromField)
        }
        return self
    }
    
    @discardableResult
    func fillEmail(value: Data) -> Self {
        XCTContext.runActivity(named: "Заполнение поля - Почта") { _ in
            type(text: value.rawValue, in: mailField)
        }
        return self
    }
    
    @discardableResult
    func checkErrorValidateEmptyField() -> Self {
        XCTContext.runActivity(named: "Проверка отображения ошибок валидации пустых полей") { _ in
            checkVisibleElement(statictext(Validate.emptyFrom))
            checkVisibleElement(statictext(Validate.emptyEmail))
            checkVisibleElement(statictext(Validate.emptyPhone))
            checkVisibleElement(statictext(Validate.emptyMessage))
        }
        return self
    }
 
    @discardableResult
    func checkAlertSuccessSent() -> Self {
        XCTContext.runActivity(named: "Проверка успешной авторизации") { _ in
            waitElement(expect: feedbackAlert, time: 5)
            checkVisibleElement(feedbackAlertText)
        }
        
        XCTContext.runActivity(named: "Проверка закрытия формы") { _ in
            tap(on: feedbackAlertButton)
            checkHideElement(feedbackForm)
        }
        return self
    }
    
}
