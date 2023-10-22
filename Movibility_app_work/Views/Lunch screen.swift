//
//  Lunch screen.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 30/03/1445 AH.
//

import SwiftUI

struct Lunch_screen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
            if self.isActive {
                Tabviews1()
                
            } else {
                Color("darkBlue")
                    .ignoresSafeArea()
                VStack {
                    
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
           
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2.6)) {
                            self.size = 1.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    Lunch_screen()
}
