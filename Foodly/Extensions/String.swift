//
//  String.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        self.count >= 8
    }

    func adjustURL() -> String {
        return self.replacingOccurrences(of: " ", with: "%20")
            .replacingOccurrences(of: "á", with: "%C3%A1")
            .replacingOccurrences(of: "â", with: "%C3%A2")
            .replacingOccurrences(of: "é", with: "%C3%A9")
            .replacingOccurrences(of: "ê", with: "%C3%AA")
            .replacingOccurrences(of: "í", with: "%C3%AD")
            .replacingOccurrences(of: "ó", with: "%C3%B3")
            .replacingOccurrences(of: "ô", with: "%C3%B4")
            .replacingOccurrences(of: "ú", with: "%C3%BA")
            .replacingOccurrences(of: "ç", with: "%C3%A7")
    }
}
