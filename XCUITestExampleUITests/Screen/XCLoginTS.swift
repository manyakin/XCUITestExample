//
//  XCLoginTS.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 04/09/2019.
//

import XCTest

extension XCLoginTS {
    struct Label {
        static let ok = "OK"
        static let save = "Save"
        static let back = "Back"
        static let logo = "logo"
        static let form = "Log In"
        static let error = "Error"
        static let login = "Login"
        static let sign = "Sign In"
        static let password = "Password"
    }
    
    enum Error: String {
        case accept = "Authorization completed"
        case equal = "Fields must not be the same!"
        case emptyLogin = "The username field is empty!"
        case emptyPassword = "The password field is empty!"
        case emptyAll = "Empty field username and password!"
    }
    
    enum Credentials: String {
        case login = "Iddqd"
        case password = "Qwer1234"
    }
}

class XCLoginTS: XCScreen {
    private lazy var logoImage = image(Label.logo)
    private lazy var alertAccept = button(Label.ok)
    private lazy var alertLogin = alert(Label.sign)
    private lazy var backButton = button(Label.back)
    private lazy var alertError = alert(Label.error)
    private lazy var saveButton = button(Label.save)
    private lazy var loginForm = navigate(Label.form)
    private lazy var loginField = textfield(Label.login)
    private lazy var passwordField = password(Label.password)

    func checkAllElements() {
        XCTContext.runActivity(named: "Отображение всех элементов формы") { _ in
            checkVisibleElement(loginForm)
            checkVisibleElement(logoImage)
            checkVisibleElement(loginField)
            checkVisibleElement(saveButton)
            checkVisibleElement(backButton)
            checkVisibleElement(passwordField)
        }
    }
    
    func checkValueElements() {
        XCTContext.runActivity(named: "Проверка текста элементов формы") { _ in
            checkLabel(for: saveButton, expected: "Login")
            checkPlaceholder(for: loginField, expected: "Username")
            checkPlaceholder(for: passwordField, expected: "Password")
        }
    }
    
    @discardableResult
    func comeIn() -> Self {
        XCTContext.runActivity(named: "Сохранение формы") { _ in
            tap(on: logoImage)
            tap(on: saveButton)
        }
        return self
    }
    
    @discardableResult
    func fillLogin(name: Credentials) -> Self {
        XCTContext.runActivity(named: "Заполнение логина") { _ in
            type(text: name.rawValue, in: loginField)
        }
        return self
    }
    
    @discardableResult
    func fillPassword(pass: Credentials) -> Self {
        XCTContext.runActivity(named: "Заполнение пароля") { _ in
            type(text: pass.rawValue, in: passwordField)
        }
        return self
    }
    
    func checkAlert(error: Error) {
        XCTContext.runActivity(named: "Проверка отображения ошибки авторизации") { _ in
            waitElement(expect: alertError, time: 5)
            checkVisibleElement(alertAccept)
            checkVisibleElement(statictext(error.rawValue))
        }
    }
    
    @discardableResult
    func checkSuccessAuth() -> Self {
        XCTContext.runActivity(named: "Проверка успешной авторизации") { _ in
            XCTContext.runActivity(named: "Проверка текста алерта") { _ in
                waitElement(expect: alertLogin, time: 5)
                checkVisibleElement(statictext(Error.accept.rawValue))
            }
            
            XCTContext.runActivity(named: "Проверка закрытия формы") { _ in
                tap(on: alertAccept)
                checkHideElement(loginForm)
            }
        }
        return self
    }

}
