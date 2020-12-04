//
//  SwiftUIView.swift
//  Cryptonic
//
//  Created by Karen Teja on 9/15/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Second View")) {
                Text("Hello, World!")
            }
        }
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
