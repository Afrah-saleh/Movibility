//
//  Picker.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 30/03/1445 AH.
//

import SwiftUI

struct ButtonView: View {
    let label: String
    @Binding var selectedChoices: [String]
   
    var body: some View {
        Button(action: {
            if selectedChoices.contains(label) {
                selectedChoices.removeAll { $0 == label }
            } else {
                selectedChoices.append(label)
            }
        })
        {
            Text(label)
                .padding()
                
                .overlay(
                              RoundedRectangle(cornerRadius: 27)
                                  .stroke(Color.lightblue, lineWidth: 7)
                      )
                
               
            
        }
        .background(selectedChoices.contains(label) ? Color.lightblue : Color.darkBlue)
        .foregroundColor(.white)
        .cornerRadius(27)
                
    }
}
struct Picker1: View {
    @State private var selectedChoices: [String] = []
    let buttonLabels = ["Western", "History", "Drama","Family" ,"Adventure" ,"Horror" ,"Fantasy","Crime" , "Animation","Thriller", "Action", "War","Romance","Comedy","Music","Sci-Fi"]
    let columns: [GridItem] = [GridItem(.flexible(minimum: 30), spacing: 30),GridItem(.flexible(minimum: 30), spacing: 20),GridItem(.flexible(minimum: 30), spacing: 15),GridItem(.flexible(minimum: 30), spacing: 5)]
   // @Binding var selectedChoicesValues: [String]
    var values : String = " "
    init() {
  

        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    @State private var isSuggestionPageActive = false

    var body: some View {
        
            NavigationView {
                ZStack {
                    Color.darkBlue
                            .ignoresSafeArea()
                    VStack {
                        Text("Choose categories")
                            .multilineTextAlignment(.trailing)
                            .padding([ .top], -320)
                            .padding([ .leading], -173.0)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                
                    }
                    
                    VStack{
                        LazyVGrid(columns: columns,  spacing: 17) {
                            ForEach(buttonLabels, id: \.self) { label in
                                ButtonView(label: label, selectedChoices: $selectedChoices)
                             
                                    .frame(width: 115, height: 50)
                                  
                                    

                            }
                            
                        }
                     
                        .padding(20)
                        NavigationLink(destination: Suggestion(movieId: Movie.stubbedMovie.id)) {
                                           Text("Apply")
                                       }
                        .frame(width: 342,height: 24)
                        .padding()
                        .background( Color.lightblue )
                        .foregroundColor(.white)
                        .border(Color.lightblue, width: 3)
                        .cornerRadius(8)
                        .frame(maxHeight: 260, alignment: .bottom)
                        
                    }
                      
                }
                .navigationBarTitle("Picker", displayMode: .inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                        .toolbarBackground(

                            // 1
                            Color.darkBlue,
                            // 2
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
            
        }
        
    }
}


#Preview {
    Picker1()
}
