//
//  ContentView.swift
//  Easy Tip Calculator
//
//  Created by Suvidha on 6/9/20.
//  Copyright © 2020 Suvidha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
       
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            TextView()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(0 ..< 4) { item in
                        
                        TipPercentageCardView()
                    }
                }
            }
            
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

struct TextView: View {
    
    @State var amount = ""
    
    var body: some View {
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
}

struct TipPercentageCardView: View {
    var body: some View {
        VStack{
            
            HStack(alignment:.top) {
                
                VStack{
                    Text("10%")
                        .font(.system(size: 18, weight: .heavy, design: .serif))
                        .frame(width: 45, height: 45, alignment: .center)
                    
                    Text("25000")
                        .font(.system(size: 25, weight: .semibold, design: .default))
                        .frame(height:30, alignment: .center)
                }
                
            }
                
            .frame(width: 100, height: 100)
            .background(Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.5), radius: 10, x: 0, y: 10)
            
           // Spacer()
            
        }
        .padding(.leading,20)
        .frame(maxHeight:150)
        //.padding(.trailing,50)
    }
}
