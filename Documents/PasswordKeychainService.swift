//
//  PasswordKeychainService.swift
//  Documents
//
//  Created by Евгений Стафеев on 15.03.2023.
//

import UIKit

struct Credentials {
    let account = "default"
    let password: String
    let serviceName = "UserCredentials"
}

class PasswordKeychainSevice {
    
    func savePassword(credentials: Credentials) {
        let query = [
            kSecValueData: Data(credentials.password.utf8),
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: credentials.serviceName,
            kSecAttrAccount: credentials.account,
        ] as CFDictionary
        SecItemAdd(query, nil)
    }
    
    func deletePassword(credentials: Credentials) {
        let query = [
            kSecAttrService: credentials.serviceName,
            kSecAttrAccount: credentials.account,
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary
        SecItemDelete(query)
    }
    
    func retrivePassword(credentials: Credentials) -> (status: OSStatus, data: Data?) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: credentials.account,
            kSecAttrService: credentials.serviceName,
            kSecReturnData: true
        ] as CFDictionary
        var extractedPasswordData: AnyObject?
        let status = SecItemCopyMatching(query, &extractedPasswordData)
        return (status, extractedPasswordData as? Data)
    }
    
    func updatePassword(credentials: Credentials) {
            let query = [
                kSecAttrService: credentials.serviceName,
                kSecAttrAccount: credentials.account,
                kSecClass: kSecClassGenericPassword,
            ] as CFDictionary
        
            let attributesToUpdate = [kSecValueData: Data(credentials.password.utf8)] as CFDictionary
            SecItemUpdate(query, attributesToUpdate)
    }
}

