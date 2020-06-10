//
//  ContentView.swift
//  Easy Tip Calculator
//
//  Created by Suvidha on 6/9/20.
//  Copyright © 2020 Suvidha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
       @State var amount = ""
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 35))
                        .foregroundColor(Color.black.opacity(0.5))
                        .frame(maxWidth: 45)
                        .frame(maxHeight: 45)
                        .background(Color.white.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 10)
                        .padding(.leading, 5)
                    

                        CustomTextField(text: $amount)
                        
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .frame(height : 60)
            .background(Color.white.opacity(0.5))
            .blendMode(.hardLight)
                
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.9), radius: 20, x: 0, y: 15)
            .padding(.horizontal)
            .offset(y: -180)
            
       }
        .onTapGesture {
        
            hideKeyboard()
        }
        
    }
}

func hideKeyboard(){
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

func textDidChange(text:String){
   print("Text did change \(text)")
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
