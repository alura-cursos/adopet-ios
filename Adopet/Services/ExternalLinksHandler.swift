//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import UIKit

class ExternalLinksHandler {
    func openTelephoneUrl(phoneNumber: String) {
        guard let phoneURL = URL(string: "tel://\(phoneNumber)") else { return }
        UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
    }
    
    func openWhatsappUrl(phoneNumber: String, message: String) {
        guard let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=\(message)") else { return }
        
        if UIApplication.shared.canOpenURL(whatsappURL) {
            UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
        } else {
            openWhatsappInAppStore()
        }
    }
    
    private func openWhatsappInAppStore() {
        guard let appStoreURL = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else { return }
        UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
    }
}
