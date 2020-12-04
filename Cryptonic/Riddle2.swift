//
//  Riddle2.swift
//  Cryptonic
//
//  Created by Karen Teja on 4/13/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

class TextBindingManager2: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 3){
        characterLimit = limit
    }
}

struct Submit2: View {
    @Binding var riddleAnswered: Bool

    var body: some View {
        NavigationLink(destination: Riddle2(), isActive: $riddleAnswered) {
            Button(action: { self.riddleAnswered.toggle()} ) {
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
        }
    }
}

struct Riddle2: View {
    
    let expectedAnswer = "RYE"
    @ObservedObject var textBindingManager = TextBindingManager(limit: "rye".count)
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var hintGiven = false
    @State var riddleAnswered = false
    
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
                Text("After being fermented")
                Text("people use me as one of the")
                Text("ingredients to make whiskey.")
                Text("")
                Text("I'm delicious!")
                Text("And I rhyme with dry")
                Text("")
                Text("What am I?")
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
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            if (!hintGiven) {
                                textBindingManager.text = ""
                                textBindingManager.text += "R"
                                hintGiven.toggle()
                            }
                        })
                }
                .offset(y:-30)

                
                ZStack(alignment:.leading){
                    TextField("", text: $textBindingManager.text
                    )
                    .opacity(0.04)
                        
                    
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
                        
                    }
                    NavigationLink(destination: WelcomeScreen(), isActive: $riddleAnswered) {
                        Button(action: {
                                self.riddleAnswered = expectedAnswer == textBindingManager.text
                            
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
                    }.offset(x: 9, y: 90)
                }.offset(x: 73, y: 0)
                
                
                
            }
        }
            Image("")
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        }
        
}


struct Riddle2_Previews: PreviewProvider {
    static var previews: some View {
        Riddle2()
    }
}
