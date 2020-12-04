//
//  Confirmation.swift
//  Cryptonic
//
//  Created by Karen Teja on 10/24/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct Confirmation: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var goToMap = false
    @Binding var rootIsActive: Bool
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
        Image(systemName: "chevron.left")
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18)
            .foregroundColor(Color("primarytext"))

        }
    }
    
    var body: some View {
        ZStack {
            
        Image("confirmation")
            .resizable()
            .scaledToFit()
            .scaleEffect(1.5)
            .offset(x:100, y:90)
            .rotationEffect(.degrees(-10))
            
            
        VStack{

            Text("Congrats!")
                .font(.system(size:30))
                .foregroundColor(Color("primarytext"))
                .fontWeight(.black)
                .font(.title)
                .offset(y:50)
            Text("That was correct!")
                .foregroundColor(Color("primarytext"))
                .fontWeight(.bold)
                .offset(y:50)
            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("WHERE")
                        .font(.system(size:12))
                        .foregroundColor(Color("black"))
                    Spacer()
                    
                    Text("The Beehive")
                        .font(.system(size:20))
                        .fontWeight(.black)
                        .offset(y:-25)
                    
                    Text("842 Valencia St.\nThe Mission, SF")
                        .foregroundColor(Color("black"))
                        .font(.system(size:12))
                        .fontWeight(.bold)
                        .offset(y:-25)
                    
                }
                .offset(x:-25)
                .padding(.horizontal)
                
                VStack(alignment: .leading){
                    
                    Text("COUPON")
                        .font(.system(size:12))
                        .foregroundColor(Color("black"))
                    Spacer()
                            HStack{
                                Text("10%")
                                    .font(.system(size:40))
                                    .fontWeight(.black)
                                Text("off")
                                    .fontWeight(.black)
                                    .font(.system(size:14))
                                    .offset(y:10)
                            }
                    Text("on special drink")
                        .foregroundColor(Color("black"))
                        .font(.system(size:12))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    }
            }
            .padding(.all)
            .frame(width: 330, height: 150)
            .background(Color("accentcolor"))
            .cornerRadius(15)
            .offset(y:60)
            .shadow(color: .gray, radius: 3, x: 0.3, y: 0.2)
            
            HStack{
            Color(.white)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
                Spacer()
            Color(.white)
                .frame(width: 50, height: 55)
                .cornerRadius(50)
            }
            .offset(y:-50)
            
            
        }
        .foregroundColor(Color("black"))
        .frame(
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight:.infinity,
            alignment:Alignment.top)
        .background(Color.white)
        .cornerRadius(25)
        .offset(y: 200)
        .shadow(radius: 10)
    
            Image("check")
                .offset(y:-170)
            
            
            VStack{
            
                NavigationLink(destination: DirectionScreen(rootIsActive: $rootIsActive), isActive: $goToMap) {
                    Button(action: {
                        self.goToMap = true
                    }) {
                    Text("Get Direction")
                        .font(.system(size:14))
                        .fontWeight(.bold)
                        .frame(width: 250, height: 50)
                        .background(Color("primarytext"))
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("primarytext"), lineWidth: 1.5))
                        }
                }.isDetailLink(false)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Save For Later")
                        .padding(.vertical)
                        .font(.system(size:12))
                        .foregroundColor(Color.gray)
                    }
                }.offset(y:220)
            
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct Confirmation_Previews: PreviewProvider {
    static var previews: some View {
        Confirmation(rootIsActive: .constant(true))
    }
}

