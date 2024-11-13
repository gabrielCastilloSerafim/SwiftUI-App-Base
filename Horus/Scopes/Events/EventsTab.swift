//
//  EventsTab.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

struct EventsTab: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        Button("Change to tab 0") {
            appEnvironment.selectedTab = 0
        }
    }
}

#Preview {
    EventsTab()
}
