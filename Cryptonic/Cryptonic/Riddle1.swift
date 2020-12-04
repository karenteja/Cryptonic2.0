//
//  Riddle1.swift
//  Cryptic
//
//  Created by Karen Teja on 4/13/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 7){
        characterLimit = limit
    }
}

struct Riddle1: View {
    
    let expectedAnswer = "BEEHIVE"
    @ObservedObject var textBindingManager = TextBindingManager(limit: "beehive".count)
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var hintGiven = false
    @State var riddleAnswered = false
    @Binding var rootIsActive: Bool
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
        Image(systemName: "chevron.left")
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18)
            .foregroundColor(Color(.white))

        }
    }
    
    func transform(a: String, b: String) {
        if (a == b) {
            riddleAnswered = true
        }
    }
    
    var body: some View {
        ZStack(alignment:.leading) {
            Image("thebeehive")
                .resizable()
                .scaledToFill()
                .position(x:200,y:-70)
                .edgesIgnoringSafeArea(.all)
            
            Text("riddle")
                .font(.system(size:35))
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .offset(y:-310)
                .padding(.all)

        VStack {

            VStack(alignment:.leading) {
        
            Text("What Am I?")
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("primarytext"))
            .padding(.horizontal)
            
            VStack (alignment:.leading, spacing: 2){
                Text("I contain golden treasures.")
                Text("Guarded by hundreds, thousands")
                Text("things that make buzzing sound.")
                Text("")
                Text("People sometimes use my treasure")
                Text("to replace sugar in their coffee.")
                Text("")
                Text("People need to wear extra protection")
                Text("when handling me and my treasures\n\nWhat am I?")
            }
            .padding(.all)
            .foregroundColor(Color("primarytext"))
        }
        .offset(x: 30, y: 45)
        .frame(
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight:.infinity,
                alignment:Alignment.topLeading )
            .background(Color.white)
            .cornerRadius(25)
            .offset(x: 0, y: 80)
        
            ZStack{
            
                
                HStack {
                    Image("send")
                        .position(x:260, y:-260)
                        .shadow(radius: 3)
                    
                    Image("hint")
                        .position(x:140, y:-260)
                        .shadow(radius: 3)
                        .onTapGesture(count: 1, perform: {
                            if (!hintGiven) {
                                textBindingManager.text = ""
                                textBindingManager.text += "B"
                                hintGiven.toggle()
                            }
                        })
                    }
                .offset(y:-30)

                
                ZStack(alignment:.leading){
                    TextField("", text: $textBindingManager.text
                    )
                    .opacity(0.05)
                        
                    
                    Text("\(textBindingManager.text)").tracking(28).offset(x: 6, y: -10)
                        .textCase(.uppercase)
                        .font(Font.body.bold())
                        .foregroundColor(Color("primarytext"))
                    HStack {
                        Color.gray
                            .frame(width: 30, height: 2)
                            .opacity(0.3)
                            .cornerRadius(3)
                        Color.gray
                            .frame(width: 30, height: 2)
                            .opacity(0.3)
                            .cornerRadius(3)
                        Color.gray
                            .frame(width: 30, height: 2)
                            .opacity(0.3)
                            .cornerRadius(3)
                        Color.gray
                            .frame(width: 30, height: 2)
                            .opacity(0.3)
                            .cornerRadius(3)
                        Color.gray
                            .frame(width: 30, height: 2)
                            .opacity(0.3)
                            .cornerRadius(3)
                        Color.gray
                            .frame(width: 30, height: 2)
                            .opacity(0.3)
                            .cornerRadius(3)
                        Color.gray
                            .frame(width: 30, height: 2)
                            .opacity(0.3)
                            .cornerRadius(3)
                    }
                    NavigationLink(destination: Confirmation(rootIsActive: $rootIsActive), isActive: $riddleAnswered) {
                        Button(action: {
                            self.riddleAnswered = (expectedAnswer.lowercased() == textBindingManager.text.lowercased())
                            
                        } ) {
                            Text("Submit")
                                .font(.system(size:14))
                                .fontWeight(.semibold)
                                .frame(width: 250, height: 50)
                                .background(Color("primarytext"))
                                .foregroundColor(Color.white)
                                .cornerRadius(30)
                                .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("primarytext"), lineWidth: 1.5))
                             }
                    }.isDetailLink(false).offset(x: 9, y: 90)
                }.offset(x: 73, y: 0)
                
                
                
            }
        }
            Image("")
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        }
        
}


struct Riddle1_Previews: PreviewProvider {
    static var previews: some View {
        Riddle1(rootIsActive: .constant(true))
    }
}
