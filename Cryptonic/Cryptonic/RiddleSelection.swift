//
//  RiddleSelection.swift
//  Cryptonic
//
//  Created by Karen Teja on 11/8/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct PreferenceLocationView: View {
    @State var selectedOption: String = ""
    
    var body: some View {
        ZStack(alignment: .leading) {
            PreferenceLocation.getLocationTitle()
            LocationCard(selectedOption: $selectedOption)
        }
        
    }
}

struct PreferenceAmbienceView: View {
    @Binding var off: CGFloat
    var body: some View {
        ZStack(alignment: .leading)  {
            PreferenceAmbience.getAmbienceTitle().offset(x: off, y: 0)
            PreferenceAmbience.getAmbienceCard()
        }
       
    }
}

struct PreferenceGoodForView: View {
    @Binding var off: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            PreferenceGoodFor.getGoodForTitle().offset(x: off, y: 0)
            PreferenceGoodFor.getGoodForCard()
        }
    }
}

struct RiddleSelection: View {
    @Binding var rootIsActive: Bool
    let offsets: [CGFloat] = [535, 175, -185, -545]
    @State var currentViewIndex = 0
    @State var secondScreenTitleOffset: CGFloat = 26.0
    @State var thirdScreenTitleOffset: CGFloat = 26.0
    @State var currentScreenPosition = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
        Image(systemName: "xmark")
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18)
            .foregroundColor(Color("primarytext"))
        
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onEnded {
                value in
                if (value.translation.width < 0 && value.translation.height > -100 && value.translation.height < 100) {
                    // swipe left
                    currentScreenPosition += 1
                    if (currentScreenPosition == 1) {
                        secondScreenTitleOffset = 0
                    }
                    if (currentScreenPosition == 2) {
                        thirdScreenTitleOffset = 0
                    }
                    self.currentViewIndex = (self.currentViewIndex + 1) % offsets.count
                }
                else if (value.translation.width > 0 && value.translation.height > -100 && value.translation.height < 100) {
                    // swipe right
                    currentScreenPosition -= 1
                    if (currentScreenPosition == 1) {
                        thirdScreenTitleOffset = 26
                    }
                    if (currentScreenPosition == 0) {
                        secondScreenTitleOffset = 26
                    }
                    self.currentViewIndex = (self.currentViewIndex - 1) % offsets.count
                }
            }
    }
    
    internal func getArrow() -> some View {
        return Image(systemName: "arrow.right")
            .foregroundColor(Color("primarytext"))
            .offset(x:315, y:-30)
    }
    var body: some View {
        let views: [Any] = [PreferenceLocationView(),
                            PreferenceAmbienceView(off: $secondScreenTitleOffset),
                           PreferenceGoodForView(off: $thirdScreenTitleOffset),
                            PreferenceLiquor(rootIsActive: $rootIsActive)]
        
        ZStack(alignment: .leading) {
            Image("Blob2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:200, height:100, alignment:.leading)
                .scaleEffect(2)
            .offset(x: 850, y:-150)
            .rotationEffect(.degrees(-18))
            
            Image("Blob2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:200, height:100, alignment:.leading)
                .scaleEffect(2)
            .offset(x: 150, y:550)
            .rotationEffect(.degrees(-25))
            
            VStack{
            HStack {
                ForEach(0..<views.count) { index in
                    ZStack(alignment: .leading) {
                        GeometryReader {
                            geometry in
                            ZStack(alignment: .leading) {
                                AnyView(_fromValue: views[index])
                            }.rotation3DEffect(
                                Angle(degrees: Double(geometry.frame(in: .global).minX - 30)) / -20,
                                axis: (x: 0, y: 20, z: 0))
                            .gesture(drag)
                            
                        }.frame(width: 350, height: 550)
                        
                    }
                }
            }
            .offset(x: offsets[self.currentViewIndex], y: 0)
            .animation(.easeInOut(duration: 0.3))
                
                
                // ------------below here is where to add the slideshow indicator ------
                
                HStack{
                    ForEach(0..<views.count) {
                        index in
                        Circle()
                            .frame(width: index == self.currentViewIndex ? 12: 8,
                                   height: index == self.currentViewIndex ? 12: 8)
                            .foregroundColor(index == self.currentViewIndex ? Color("primarytext") : .white)
                            .overlay(Circle().stroke(Color("primarytext"), lineWidth: 1))
//                            .opacity(index == self.currentViewIndex ? 1: 0.5)
                            .padding(.bottom, 8)
                            .animation(.spring())
                            
                            
                    }
                }.offset(x: 0, y: 30)
                
               
        }
            


        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        
    }
}


struct Flow1_Previews: PreviewProvider {
    static var previews: some View {
        RiddleSelection(rootIsActive: .constant(true))
    }
}
