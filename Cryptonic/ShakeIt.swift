//
//  ShakeIt.swift
//  Cryptonic
//
//  Created by Karen Teja on 11/29/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct ShakeView: View {
    @State var selected = false

    var body: some View {
        VStack {
            Button(action: {
                self.selected.toggle()
            }) { selected ? Text("Deselect") : Text("Select") }
            Rectangle()
                .fill(Color.purple)
                .frame(width: 200, height: 200)
                .offset(x: selected ? -30 : 0)
                .animation(Animation.default.repeatCount(5).speed(6))
        }
    }
}


struct ShakeIt_Previews: PreviewProvider {
    static var previews: some View {
        ShakeView()
    }
}
