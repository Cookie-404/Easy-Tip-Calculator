//
//  CustomTextField.swift
//  Easy Tip Calculator
//
//  Created by Suvidha on 6/9/20.
//  Copyright © 2020 Suvidha. All rights reserved.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
   
    @Binding var text:String

    typealias UIViewType = UITextField
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
      
        let textField = UITextField(frame: .zero)
        textField.textAlignment = .left
        textField.placeholder = "Enter your amount"
        textField.font = .boldSystemFont(ofSize: 18)
        textField.keyboardType = .numberPad
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
    
    }
    
    func makeCoordinator() -> Coordinator {
           return Coordinator(text: $text)
       }
    
    class Coordinator :NSObject, UITextFieldDelegate{
        
        @Binding var text:String
        
        init(text: Binding<String>){
            _text = text
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
            
            let currText  = textField.text! + string
           // print(currText)
            
            textDidChange(text: currText)

            return true
            
        }
        
    }
    
}



