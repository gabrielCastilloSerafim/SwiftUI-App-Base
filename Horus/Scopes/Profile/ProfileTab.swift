//
//  ProfileTab.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

struct ProfileTab: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ProfileTab()
}
