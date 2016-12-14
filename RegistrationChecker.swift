//
//  RegistrationChecker.swift
//  ToTheResort
//
//  Created by Булат Галиев on 14.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import Foundation

class RegistrationChecker {
    func checkInput(email: String, password: String) -> String? {
        if email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" || password.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            return "Please fill the fields"
        } else if !isValidEmail(email: email) {
            return "Email has incorrect format"
        } else if !isValidPassword(password: password) {
            return "Password has incorrect format. Ensure string has at least one uppercase letter, one special case letter, one digit, one lower case letter and is of length 8"
        } else {
            return nil
        }
    }
    
    func checkInput(email: String, password: String, repeatedPassword: String) -> String? {
        if let answer = checkInput(email: email, password: password) {
            return answer
        } else if password != repeatedPassword {
            return "Repeated password is not equal to password"
        } else {
            return nil
        }
    }
    
    func isStringConformingTo(_ testString: String, to regex:String) -> Bool {
        let testPredicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return testPredicate.evaluate(with: testString)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return isStringConformingTo(email, to: emailRegex)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        return isStringConformingTo(password, to: passwordRegex)
    }
}
