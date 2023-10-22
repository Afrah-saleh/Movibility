//
//  ActivityIndicatorView.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 26/03/1445 AH.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
