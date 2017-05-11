//
//  PasswordVerifierSpec.swift
//  tddSwiftBlank
//


import Quick
import Nimble
@testable import tddSwiftBlank

class PasswordVerifierSpec: QuickSpec {
    override func spec() {
        describe("checking password length") {
            it("should reject a password that is less than 8 characters long") {
                expect("passwor".ck_isValidLength()).to(beFalsy())
            }
            it("should accept a password that is 8 characters long") {
                expect("12345678".ck_isValidLength()).to(beTruthy())
            }
            it("should accept a password that is longer than 8 characters", closure: {
                expect("123456789".ck_isValidLength()).to(beTruthy())
            })
        }
        describe("checking password contains") {
            it("should decline a password with all lowercase characters") {
                expect("aaa".ck_hasUpperAndLowercase()).to(beFalsy())
            }
            it("should accept a password with both uppercase and lowercase characters") {
                expect("aB".ck_hasUpperAndLowercase()).to(beTruthy())
            }
            it("should decline a password with all uppercase characters") {
                expect("BBB".ck_hasUpperAndLowercase()).to(beFalsy())
            }
        }
        describe("checking password written in numerical digits") {
            it("should accept a password with a number character") {
                expect("1".ck_containsNumber()).to(beTruthy())
            }
            it("should decline a password with no number character") {
                expect("aBcD".ck_containsNumber()).to(beFalsy())
            }
        }
    }
}
