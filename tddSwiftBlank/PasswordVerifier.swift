//
//  PasswordVerifier.swift
//  tddSwiftBlank
//


//import Foundation

public extension String {
    public func ck_isValidLength() -> Bool {
        if self.characters.count == 8 {
            return true
        } else if self.characters.count > 8 {
            return true
        }
        return false
    }
    
    public func ck_hasUpperAndLowercase() -> Bool {
        return self != self.lowercased() && self != self.uppercased()
    }
    
    public func ck_containsNumber() -> Bool {
        if self.rangeOfCharacter(from: .decimalDigits) == nil {
            return false
        }
        return true
    }
}
