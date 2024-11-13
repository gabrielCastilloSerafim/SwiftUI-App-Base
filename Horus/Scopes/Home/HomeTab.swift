//
//  HomeTab.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

struct HomeTab: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        VStack {
            Text("Hello \(appEnvironment.loggedInUser?.name)")
            Button("Logout") {
                appEnvironment.userDidLogOut()
            }
        }
    }
}

#Preview {
    HomeTab()
}
