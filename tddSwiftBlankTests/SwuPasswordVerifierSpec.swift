//
//  SwuPasswordVerifierSpec.swift
//  tddSwiftBlank
//


import Quick
import Nimble
@testable import tddSwiftBlank

class SwuPasswordVerifierSpec: QuickSpec {
    override func spec() {
        xdescribe("password verifier") {
            describe("verfifying password length") {
                it("should accept passwords of 8 characters") {
                    expect("password".swu_verifyLength()).to(beTruthy())
                }
                it("should reject passwords shorter than 8 characters") {
                    expect("passwor".swu_verifyLength()).to(beFalsy())
                }
                it("should accept passwords longer than 8 characters") {
                    expect("passwords".swu_verifyLength()).to(beTruthy())
                }
            }
            describe("verifying for uppercase and lowercase characters") {
                it("should reject passwords with only lowercase characters") {
                    expect("password".swu_verify1Uppercase1Lowercase()).to(beFalsy())
                }
                it("should reject passwords with only uppercase characters") {
                    expect("PASSWORD".swu_verify1Uppercase1Lowercase()).to(beFalsy())
                }
                it("should reject passwords with only uppercase characters") {
                    expect("passWORD".swu_verify1Uppercase1Lowercase()).to(beTruthy())
                    expect("pASSWORD".swu_verify1Uppercase1Lowercase()).to(beTruthy())
                    expect("passworD".swu_verify1Uppercase1Lowercase()).to(beTruthy())
                }
            }
            describe("verifying for number characters") {
                it("should reject passwords without a number character") {
                    expect("password".swu_verify1Number()).to(beFalsy())
                }
                it("should accept passwords with a number character") {
                    expect("passw0rd".swu_verify1Number()).to(beTruthy())
                    expect("p4ssw0rd".swu_verify1Number()).to(beTruthy())
                }
            }
            describe("determining strong passwords") {
                it("should classify passwords as strong when it passes length, upper/lower-case, and number verification") {
                    expect("Passw0rd".swu_strength()).to(equal(PasswordStrength.strong))
                    expect("P4ssW0rd".swu_strength()).to(equal(PasswordStrength.strong))
                }
                it("should not classify password as strong if it does not pass length verification") {
                    expect("P4ssW0r".swu_strength()).to(equal(PasswordStrength.weak))
                }
                it("should not classify password as strong if it does not pass upper/lower-case verification") {
                    expect("p4ssw0rd".swu_strength()).to(equal(PasswordStrength.medium))
                }
                it("should not classify password as strong if it does not pass number verification") {
                    expect("Password".swu_strength()).to(equal(PasswordStrength.medium))
                }
            }
            describe("determining weak passwords") {
                it("should classify password as weak if it does not pass length verification") {
                    expect("P4ssW0r".swu_strength()).to(equal(PasswordStrength.weak))
                }
                it("should classify password as weak if it passes length verification, but neither upper/lower-case nor number verification") {
                    expect("password".swu_strength()).to(equal(PasswordStrength.weak))
                }
                it("should not classify password as weak if it passes length verification and either upper/lower-case or number verification or both") {
                    expect("Password".swu_strength()).to(equal(PasswordStrength.medium))
                    expect("p4ssword".swu_strength()).to(equal(PasswordStrength.medium))
                }
            }
            //Is this test needed?  See strong password assertions.
            describe("determing medium passwords") {
                it("should classify passwords as medium if it is neither strong nor weak") {
                    expect("passworD".swu_strength()).to(equal(PasswordStrength.medium))
                }
            }

        }
    }
}
