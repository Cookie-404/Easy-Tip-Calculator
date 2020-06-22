//
//  TipPercentageCardView.swift
//  Easy Tip Calculator
//
//  Created by Suvidha on 6/13/20.
//  Copyright © 2020 Suvidha. All rights reserved.
//

import SwiftUI

struct TipPercentageCardView: View {
    
    @ObservedObject var tip:Tip
    var card: Card
    
   
    var body: some View {
        
        VStack{
            
            HStack() {
                
                VStack{
                    Text(String(card.percent)+"%")
                        .font(.system(size: 18, weight: .heavy, design: .serif))
                        .frame(width: 45, height: 45, alignment: .center)
                    
                    
                    Text(card.tipAmount)
                    .font(.system(size: 25, weight: .semibold, design: .default))
                    .frame(height:30, alignment: .center)
                    
                }
                
            }
            .frame(width: 100, height: 100)
            .background(card.color)
            .blendMode(.hardLight)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .shadow(color: card.color.opacity(0.5), radius: 10, x: 0, y: 10)
 
            
        }
        .padding(.leading,10)
        .padding(.trailing,10)
        .frame(maxHeight:150)
        
    }
  
    
}


//struct Card:Identifiable{
//    
//    var id = UUID()
//    var percent:String
//    var tipAmount:String
//    var color:Color
//}
//
//
//let CardData =
//    [Card(percent: "10%", tipAmount: "0", color: Color(#colorLiteral(red: 0.9668827653, green: 0.7796407342, blue: 0.3437191546, alpha: 1))),
//     Card(percent: "12%", tipAmount: "0", color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),
//     Card(percent: "15%", tipAmount: "0", color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
//     Card(percent: "18%", tipAmount: "0", color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 0.8650738442))),
//     Card(percent: "20%", tipAmount: "0", color: Color(#colorLiteral(red: 0.915499568, green: 0.5708348751, blue: 0.2972137034, alpha: 1)))]





//struct TipPercentageCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TipPercentageCardView()
//    }
//}


