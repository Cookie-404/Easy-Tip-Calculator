//
//  SettingsView.swift
//  Easy Tip Calculator
//
//  Created by Suvidha on 6/22/20.
//  Copyright © 2020 Suvidha. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            
             Color(#colorLiteral(red: 0.157455951, green: 0.5721796155, blue: 0.9853222966, alpha: 0.7995237586))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Text("Settings")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                }
                Spacer()
            }
            .offset(x: -120, y: 20)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
