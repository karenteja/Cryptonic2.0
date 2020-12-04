//
//  Cocktail.swift
//  Cryptic
//
//  Created by Karen Teja on 10/26/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct Cocktail: View {
    @Binding var rootIsActive: Bool
    var body: some View {
        ZStack{
          
        VStack{
            Image("pearlemonfizz")
            .resizable()
            .scaledToFit()
            .edgesIgnoringSafeArea(.all)
                .offset(y:-95)
            
            Spacer()
            }
            
            ZStack{
                Color.white
                    .cornerRadius(30)
                    .frame(height: 400)
                    .frame(maxWidth:.infinity)
                    .offset(y:230)
            
                VStack{
                    Text("Pear + Lemon Fizz")
                        .fontWeight(.black)
                        .font(.system(size: 30))
                        .foregroundColor(Color("primarytext"))
                        .offset(x: -10)
                        
                    VStack(alignment: .leading){
                    Text("The combination of pear juice and lemon is what makes this drink fruity and refreshing. No one can deny that!")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        
                    HStack{
                    Text("Strength")
                        .fontWeight(.black)
                        .font(.system(size: 14))
                        .foregroundColor(Color("primarytext"))
                        .padding(.top)
                    Image("strength")
                        .scaleEffect(0.5)
                        .offset(x: -25 ,y:8)
                        }
                        
                }
                .padding(.all)
                .frame(width: 320)
                    
                Button(action: {
                    self.rootIsActive = false
                }) {
                    Text("Search for more bars")
                        .font(.system(size:14))
                        .fontWeight(.bold)
                        .frame(width: 250, height: 50)
                        .background(Color("primarytext"))
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("primarytext"), lineWidth: 1.5))
                     }
                    Button(action: {
                        
                    }) {
                        Text("Go to Homepage")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .font(.system(size:12))
                            .foregroundColor(Color("primarytext"))
                        
                        }
                
                }
                .offset(y:200)
     
            }
        }.navigationBarHidden(true)
    }
}

struct Cocktail_Previews: PreviewProvider {
    static var previews: some View {
        Cocktail(rootIsActive: .constant(true))
    }
}
