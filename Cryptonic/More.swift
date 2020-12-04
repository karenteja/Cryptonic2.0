//
//  More.swift
//  Cryptonic
//
//  Created by Karen Teja on 10/26/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct More: View {
    @State private var isToggle : Bool = false
    @State private var isToggle2 : Bool = false
    
    
    var body: some View {
    ZStack{
//--------------the whole content of "more" begins----------
        VStack{
        Text("More")
            .fontWeight(.bold)
            .opacity(0.6)
        Color.gray
            .frame(maxWidth: .infinity)
            .frame(height: 4)
            .opacity(0.3)
            .cornerRadius(3)
        
        VStack(alignment: .leading){
            
            HStack{
                Text("Email address")
                    .fontWeight(.bold)
                    .foregroundColor(Color("primarytext"))
                Spacer()
                Text("chriscool@gmail.com")
                    .foregroundColor(.gray)
                
                }.padding(.bottom)
    
            
            HStack{
                VStack{
                    Color.gray
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .opacity(0.3)
                        .cornerRadius(3)
                    HStack{
                            Text("Phone #")
                                .fontWeight(.bold)
                                .foregroundColor(Color("primarytext"))
                            Spacer()
                            Text("+1(415) 989 8977")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical)
                    }
                }
            HStack{
                VStack{
                    Color.gray
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .opacity(0.3)
                        .cornerRadius(3)
                    HStack{
                            Text("Password")
                                .fontWeight(.bold)
                                .foregroundColor(Color("primarytext"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical)
                    Color.gray
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .opacity(0.3)
                        .cornerRadius(3)
                    VStack{
                    HStack{
                        Text("Edit profile")
                        .fontWeight(.bold)
                        .foregroundColor(Color("primarytext"))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                    }
                    }.padding(.vertical)

                    }
                
                }
            
            }
            .padding(.all)
            Color.gray
                .frame(maxWidth: .infinity)
                .frame(height: 3)
                .opacity(0.3)
                .cornerRadius(3)
            
           
            
            VStack(alignment: .leading){
                
                Text("Notifications")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .opacity(0.8)
                    .padding(.vertical)
                Color.gray
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .opacity(0.3)
                    .cornerRadius(3)
                VStack(alignment: .leading){
                Text("New riddles")
                    .fontWeight(.bold)
                    .foregroundColor(Color("primarytext"))
                    .padding(.bottom)
                    HStack{
                        Text("We will send you notifications\nfor new bars on Cryptonic")
                        Spacer()
                        Toggle(isOn: $isToggle){
                        }.toggleStyle(SwitchToggleStyle(tint: Color("primarytext")))
                        .frame(width: 60)
                    }
                    .foregroundColor(.gray)
                }
                    .padding(.vertical)
                
                Color.gray
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .opacity(0.3)
                    .cornerRadius(3)
                
                VStack(alignment: .leading){
                Text("New promotions")
                    .fontWeight(.bold)
                    .foregroundColor(Color("primarytext"))
                HStack{
                    Text("We will send you notifications for\nnew promotions on Cryptonic")
                    Spacer()
                Toggle(isOn: $isToggle2){
                }.toggleStyle(SwitchToggleStyle(tint: Color("primarytext")))
                .frame(width: 60)
                }
                .foregroundColor(.gray)
                .padding(.vertical)
                }
                .padding(.top)
                }
                .padding(.bottom)
                .padding(.horizontal)
            
//--------------switch to manager screen----------
            
            VStack{
                Color.gray
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .opacity(0.3)
                    .cornerRadius(3)
           
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Switch to manager screen")
                        .fontWeight(.bold)
                        .foregroundColor(Color("grey"))
                        .padding(.top)
                        }
                    }
                    Spacer()
            
            
        }
        
//-------here's the end of the layout of "more" content------
        
   
        }
    
    }
}

struct More_Previews: PreviewProvider {
    static var previews: some View {
        More()
    }
}
