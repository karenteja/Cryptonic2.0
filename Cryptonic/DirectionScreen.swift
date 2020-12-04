//
//  DirectionScreen.swift
//  Cryptonic
//
//  Created by Karen Teja on 10/27/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct DirectionScreen: View {
    var locationManager = LocationManager()
    @Binding var rootIsActive: Bool
    @State  var goToNext = false
    var body: some View {
        
        ZStack{
            
            MapView()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity)
            
            VStack{
            HStack{
                Image("destination")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 25)
        
                Text("The Beehive on Valencia St.")
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("|")
                    .textCase(.uppercase)
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .opacity(0.5)
                Image("walk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("6 mins")
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                    .foregroundColor(Color("primarytext"))
                  
                }
                .frame(maxWidth: .infinity)
            
                .frame( height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray, lineWidth: 0.5))
                .padding()
                .offset(y:-100)
                
                Spacer()
                
                NavigationLink(
                    destination: QR(rootIsActive: $rootIsActive), isActive: $goToNext) {
                    Button(action: {
                        self.goToNext = true
                    }) {
                        Text("I've arrived!")
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
                
                HStack{
                    Image("beehive")
                        .resizable()
                        .frame(width: 105, height: 95)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 1){
                            Text("The Beehive")
                                .fontWeight(.black)
                                .font(.system(size: 18))
                                .foregroundColor(Color("primarytext"))
                        Text("$$  Cocktails and Bites")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                            Text("842 Valencia St. Mission")
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        Text("Open hours: 3pm - 2am")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("")
                        Text("View Menu")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                            .foregroundColor(Color("primarytext"))
         
                        
                            }
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 130)
                    .background(Color.white)
                    .cornerRadius(30)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 0.5))
                    .padding(.horizontal)
                }
//            the end of VStack----------------
            
            }.navigationBarBackButtonHidden(true)
//        the end of ZSTack----------------
    }
}

struct DirectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        DirectionScreen(rootIsActive: .constant(true))
    }
}
