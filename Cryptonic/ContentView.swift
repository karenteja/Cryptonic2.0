//
//  ContentView.swift
//  Cryptonic
//
//  Created by Karen Teja on 3/13/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct ContentView: View{
    @State var enter = false
    var body: some View{
        NavigationView {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color("primarytext"), .black]), center: .center, startRadius: 100, endRadius: 600)
            .edgesIgnoringSafeArea(.all)
            
        VStack{
            VStack{
            Image("logo1")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 130)
            
            Text("CRYPTONIC")
                .font(.system(size:20))
                .fontWeight(.black)
                .foregroundColor(Color.white)
            }.offset(y:-30)
            
            VStack{
                NavigationLink(
                    destination: ProfileScreen(), isActive: $enter) {
                Button(action: {
                    self.enter = true
                }) {
            Text("Sign in as a customer")
                .font(.system(size:14))
                .fontWeight(.bold)
                .frame(width: 250, height: 50)
                .background(Color.white)
                .foregroundColor(Color("primarytext"))
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white, lineWidth: 1.5))
            }.padding(.all).navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                }

            
            Button(action: {}) {
            Text("Sign in as a manager")
                .font(.system(size:14))
                .frame(width: 250, height: 50)
                .background(Color("accentcolor"))
                .foregroundColor(Color("text1"))
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color("accentcolor"), lineWidth: 1.5))
                }
            }.offset(y:80)
    }
}
            
}
        
    }
}
    


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        ContentView()
        
    }
}
