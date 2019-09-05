//
//  XCLogin.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 04/09/2019.
//

import XCTest

class XCLogin: XCBase {
    
    //Проверка отображения всех элементов
    func testViewLoginForm() {
       XCHomeTS().openLoginForm()
       XCLoginTS().checkAllElements()
    }
    
    //Проверка текста элементов формы
    func testCheckValueLoginForm() {
        XCHomeTS().openLoginForm()
        XCLoginTS().checkValueElements()
    }
    
    //Проверка отображения алерта валидации с пустым логином и паролем
    func testViewErrorWithAllEmptyFields() {
        XCHomeTS().openLoginForm()
        XCLoginTS()
            .comeIn()
            .checkAlert(error: .emptyAll)
    }
    
    //Проверка отображения алерта валидации с пустым логином
    func testViewErrorWithEmptyLogin() {
        XCHomeTS().openLoginForm()
        XCLoginTS()
            .fillPassword(pass: .password)
            .comeIn()
            .checkAlert(error: .emptyLogin)
    }
    
    //Проверка отображения алерта валидации с пустым паролем
    func testViewErrorWithEmptyPassword() {
        XCHomeTS().openLoginForm()
        XCLoginTS()
            .fillLogin(name: .login)
            .comeIn()
            .checkAlert(error: .emptyPassword)
    }
    
    //Проверка отображения алерта валидации с одинаковыми значениями
    func testViewErrorWithEqualValue() {
        XCHomeTS().openLoginForm()
        XCLoginTS()
            .fillLogin(name: .login)
            .fillPassword(pass: .login)
            .comeIn()
            .checkAlert(error: .equal)
    }
    
    //Проверка выполнения успешной авторизации
    func testViewSuccessAuth() {
        XCHomeTS().openLoginForm()
        XCLoginTS()
            .fillLogin(name: .login)
            .fillPassword(pass: .password)
            .comeIn()
            .checkSuccessAuth()
    }
    
}
