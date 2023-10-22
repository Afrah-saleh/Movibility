//
//  LoadingView.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 26/03/1445 AH.
//

import SwiftUI

struct LoadingView: View {
    let isLoading: Bool
       let error: NSError?
       let retryAction: (() -> ())?
    
    var body: some View {
        Group{
            if isLoading {
                HStack {
                    Spacer()
                    ActivityIndicatorView()
                    Spacer()
                }
            } else if error != nil {
                HStack {
                    Spacer()
                    VStack(spacing: 4) {
                        Text(error!.localizedDescription).font(.headline)
                        if self.retryAction != nil {
                            Button(action: self.retryAction!) {
                                Text("Retry")
                            }
                            .foregroundColor(Color.blue)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoadingView(isLoading: true, error: nil, retryAction: nil)
}
