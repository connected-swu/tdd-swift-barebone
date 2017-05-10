//
//  SwuPasswordVerifier.swift
//  tddSwiftBlank
//


import Foundation

public enum PasswordStrength {
    case medium
    case strong
    case weak
}

public extension String {
    
    public func swu_verifyLength() -> Bool {
        return self.characters.count >= 8
    }
    
    public func swu_verify1Uppercase1Lowercase() -> Bool {
        return self != lowercased() && self != uppercased()
    }
    
    public func swu_verify1Number() -> Bool {
        return rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
    }
    
    public func swu_strength() -> PasswordStrength {
        if swu_verifyLength()
            && swu_verify1Uppercase1Lowercase()
            && swu_verify1Number() {
            return .strong
        }
        if !swu_verifyLength() {
            return .weak
        }
        if !(swu_verify1Number()
            || swu_verify1Uppercase1Lowercase()) {
            return .weak
        }
        return .medium
    }
    
}
