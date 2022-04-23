//
//  ContentView.swift
//  Shared
//
//  Created by jamie on 4/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // computed property -- runs when this struct is initialized
        // inherits from view
        // var is called `body`
        VStack(alignment:.leading) {
            Image("hamter")
                .aspectRatio(contentMode: .fit)
            Text("hello hamster")
                .font(.headline)
            Text("funny ainmal")
                .font(.subheadline)
            PentaStat()
                .frame(width: 100.0, height: 100.0)
                .padding()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
