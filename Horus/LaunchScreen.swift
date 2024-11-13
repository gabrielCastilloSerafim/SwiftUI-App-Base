//
//  LaunchScreen.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

struct LaunchScreen: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(2)
            .padding()
    }
}

#Preview {
    LaunchScreen()
}
