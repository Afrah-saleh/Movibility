//
//  SafariView.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 26/03/1445 AH.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
