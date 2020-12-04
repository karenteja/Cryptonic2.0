//
//  QR.swift
//  Cryptic
//
//  Created by Karen Teja on 10/26/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct QR: View {
    @Binding var rootIsActive: Bool
    var body: some View {
        
        ZStack{
            Image("thebeehive")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: .infinity)
                .position(x:70, y:448)
                .edgesIgnoringSafeArea(.all)
            Color(.white)
                .frame(width:380, height: 700)
                .cornerRadius(40)
                .offset(y:-60)
            
            VStack {
                
                VStack{
                Text("The Beehive")
                    .font(.title2)
                    .foregroundColor(Color("primarytext"))
                    .fontWeight(.black)
       
                VStack{
                    Text("842 Valencia St. San Francisco, CA")
                    Text("The Mission")
                }
                .padding(.bottom)
                .foregroundColor(Color.gray)
                .font(.system(size: 14))
                }
                .offset(y:-30)
                
                
                VStack{
                    Text("Please show this QR code to any")
                        .fontWeight(.bold)
                    Text("bartender to be scanned")
                        .fontWeight(.bold)
                }
                .padding(.top)
                .foregroundColor(Color("primarytext"))
                .font(.system(size: 13))
                
                NavigationLink(
                    destination: Cocktail(rootIsActive: $rootIsActive)) {
                    Image("QR")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }.isDetailLink(false)
                
    
            }.offset(y:-60)
        }.navigationBarBackButtonHidden(true)
    }
}

struct QR_Previews: PreviewProvider {
    static var previews: some View {
        QR(rootIsActive: .constant(true))
    }
}
