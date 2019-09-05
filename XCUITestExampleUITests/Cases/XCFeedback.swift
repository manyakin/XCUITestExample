//
//  XCFeedback.swift
//  XCUITestExampleUITests
//
//  Created by Ilya Manyakin on 05/09/2019.
//

import XCTest

class XCFeedback: XCBase {
    
    //Проверка отображения всех элементов формы
    func testViewFeedbackForm() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS().checkAllElements()
    }
    
    //Проверка текста элементов формы
    func testCheckValueFeedbackForm() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS().checkAllElements()
    }
    
    //Проверка отображения ошибок валидации пустых полей
    func testViewErrorValidateEmptyField() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS()
            .saveForm()
            .checkErrorValidateEmptyField()
    }
    
    //Проверка отображения ошибки некорректного ввода у поля - Email
    func testViewIncorrectErrorEmailField() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS()
            .fillEmail(value: .errorMail)
            .saveForm()
            .checkValidateError(error: .invalidEmail)
    }
    
    //Проверка отображения ошибки некорректного ввода у поля - From
    func testViewIncorrectErrorFromField() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS()
            .fillFrom(value: .lessTwoSymbol)
            .saveForm()
            .checkValidateError(error: .invalidFrom)
    }
    
    //Проверка отображения ошибки некорректного ввода у поля - Phone
    func testViewIncorrectErrorPhoneField() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS()
            .fillPhone(value: .errorPhone)
            .saveForm()
            .checkValidateError(error: .invalidPhone)
    }
    
    //Проверка отображения ошибки некорректного ввода у поля - Message
    func testViewIncorrectErrorMessageField() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS()
            .fillMessage(value: .lessThreeSymbol)
            .saveForm()
            .checkValidateError(error: .invalidMessage)
    }
    
    //Проверка выполнения успешной отправки сообщения
    func testViewSuccessSent() {
        XCHomeTS().openFeedbackForm()
        XCFeedbackTS()
            .fillEmail(value: .mail)
            .fillFrom(value: .city)
            .fillPhone(value: .phone)
            .fillMessage(value: .message)
            .saveForm()
            .checkAlertSuccessSent()
    }
    
}
