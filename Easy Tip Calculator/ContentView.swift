//
//  ContentView.swift
//  Easy Tip Calculator
//
//  Created by Suvidha on 6/9/20.
//  Copyright © 2020 Suvidha. All rights reserved.
//

import SwiftUI
import Combine


struct Card:Identifiable{
    
    var id = UUID()
    var percent:Int
    var tipAmount:String
    var color:Color
}


class Tip: ObservableObject {
    var didChange  = PassthroughSubject<Void, Never>()
    
    @Published var totalAmount = "" {didSet {didChange.send()}}
  
    @Published var cardData:[Card] =
        [
            .init(percent: 10, tipAmount: "0", color: Color(#colorLiteral(red: 0.9668827653, green: 0.7796407342, blue: 0.3437191546, alpha: 1))),
            .init(percent: 12, tipAmount: "0", color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),
            .init(percent: 15, tipAmount: "0", color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
            .init(percent: 18, tipAmount: "0", color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 0.8650738442))),
            .init(percent: 20, tipAmount: "0", color: Color(#colorLiteral(red: 0.915499568, green: 0.5708348751, blue: 0.2972137034, alpha: 1)))
        ]
    
}

struct ContentView: View {
    
    @ObservedObject var tip = Tip()
    @State var showSettings = false
 
    var body: some View {
        
        let binding = Binding(
            get: { self.tip.totalAmount},
            set: { self.tip.totalAmount = $0
               
                if(Int(self.tip.totalAmount) != nil){
                    
                    
                    for i in 0..<self.tip.cardData.count{
                        
                        self.tip.cardData[i].tipAmount =  String (Int(self.tip.totalAmount)! * self.tip.cardData[i].percent/100)
                    }
                    
                }
                else{
                    
                    for i in 0..<self.tip.cardData.count{
                        self.tip.cardData[i].tipAmount = "0"
                    }

                }
        }
        )
        
      return  ZStack {
            Color(#colorLiteral(red: 0.157455951, green: 0.5721796155, blue: 0.9853222966, alpha: 0.7995237586))
                .edgesIgnoringSafeArea(.all)
            
        
        VStack {
            HStack{
                
                Button(action: {
                    self.showSettings.toggle()
                }) {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 50, maxHeight: 50)
                        .font(.system(size: 30))
                }
                .sheet(isPresented: $showSettings){
                    SettingsView()
                }
            }
            .frame(maxWidth: 50, maxHeight: 50)
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.5))
            .cornerRadius(15)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), radius: 1.5, x: 0, y: 1)
            .offset(x: 150, y: 20)
            Spacer()
        }
        

            TextView(amount: binding)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0){
                    
                    
                    ForEach(tip.cardData) { _card in
                        
                       // getTipPercentage(_text: self.tip)
                        
                        TipPercentageCardView(tip: self.tip, card: _card)
                        
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextView: View {
    
    //@ObservedObject var _tip:Tip
    
    @Binding var amount:String
    
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
                
                TextField("Enter your amount", text: $amount)
                    .keyboardType(.numberPad)
                    .font(.system(size: 21, weight: .bold, design: .serif))
                    .frame(height: 50)
        
                    
                
                //CustomTextField(text: $amount)
                
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


